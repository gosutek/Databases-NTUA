import { Component, OnInit, ViewChild } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { VisitToServiceDTO } from 'src/app/dto/visit-to-service';
import { BaseService } from 'src/app/services/base.service';
import { MomentDateAdapter, MAT_MOMENT_DATE_ADAPTER_OPTIONS } from "@angular/material-moment-adapter";
import * as moment from 'moment'
import { Auxiliary } from 'src/app/utils/auxiliary';
import { DateAdapter, MAT_DATE_FORMATS, MAT_DATE_LOCALE } from '@angular/material/core';

export const MY_FORMATS = {
  parse: {
    dateInput: 'LL',
  },
  display: {
    dateInput: 'LL',
    monthYearLabel: 'MMM YYYY',
    dateA11yLabel: 'LL',
    monthYearA11yLabel: 'MMMM YYYY',
  }
};

@Component({
    selector: 'app-services',
    templateUrl: './services.component.html',
    providers: [
        {
            provide: DateAdapter,
            useClass: MomentDateAdapter,
            deps: [MAT_DATE_LOCALE, MAT_MOMENT_DATE_ADAPTER_OPTIONS]
        },
        {provide: MAT_DATE_FORMATS, useValue: MY_FORMATS}
    ],
    styleUrls: ['./services.component.scss']
})
export class ServicesComponent implements OnInit {
    @ViewChild(MatPaginator) paginator: MatPaginator;
    @ViewChild(MatSort) sort: MatSort;

    visitsToServicesDatasource: MatTableDataSource<VisitToServiceDTO>
    displayedColumns: string[] = ['NFC_ID', 'service_id', 'service_desc','entry_datetime','exit_datetime','charge_amount']
    Auxiliary = Auxiliary

    //Filtered Variables
    selectedServiceId = ""
    selectedDate = ""
    selectedMinCost = ""
    selectedMaxCost = ""

    visitsToServicesFiltersFormGroup = new FormGroup({
        serviceId: new FormControl(''),
        date: new FormControl(),
        minCost: new FormControl(),
        maxCost: new FormControl()
    });

    constructor(private baseService: BaseService) {
    }

    ngOnInit(): void {
        this.onFilterChanges()
        this.updateTable()
    }

    updateTable() {
        this.baseService.getVisitsToServices(this.selectedServiceId,this.selectedDate,this.selectedMinCost,this.selectedMaxCost).subscribe(
            response => {
                console.log(response)
                this.visitsToServicesDatasource = new MatTableDataSource(JSON.parse(JSON.stringify(response)))
                this.visitsToServicesDatasource.sort = this.sort;
                this.visitsToServicesDatasource.paginator = this.paginator
            }
        )
    }

    onFilterChanges() {
        this.visitsToServicesFiltersFormGroup.valueChanges.subscribe(formValues => {
            if (formValues.serviceId != null) {
                this.selectedServiceId = formValues.serviceId
            }

            if (formValues.date != null) {
                this.selectedDate = moment(new Date(formValues.date)).format("YYYY-MM-DD");
            }

            if (formValues.minCost != null) {
                this.selectedMinCost = formValues.minCost
            }

            if (formValues.maxCost != null) {
                this.selectedMaxCost = formValues.maxCost
            }

            if (this.visitsToServicesFiltersFormGroup.get('serviceId').dirty) {
                this.visitsToServicesFiltersFormGroup.get('serviceId').markAsPristine()
                this.updateTable();
            }

            if (this.visitsToServicesFiltersFormGroup.get('date').dirty) {
                this.visitsToServicesFiltersFormGroup.get('date').markAsPristine()
                this.updateTable();
            }
        })
    }
}
