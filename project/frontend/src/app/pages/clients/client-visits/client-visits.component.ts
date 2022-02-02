import { Component, OnInit, ViewChild } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import * as moment from 'moment'
import { MAT_MOMENT_DATE_ADAPTER_OPTIONS, MomentDateAdapter } from '@angular/material-moment-adapter';
import { DateAdapter, MAT_DATE_FORMATS, MAT_DATE_LOCALE } from '@angular/material/core';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { Router } from '@angular/router';
import { ClientDTO } from 'src/app/dto/client-dto';
import { VisitToVenueDTO } from 'src/app/dto/visit-to-venue';
import { BaseService } from 'src/app/services/base.service';
import { Auxiliary } from 'src/app/utils/auxiliary';

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
    selector: 'app-client-visits',
    templateUrl: './client-visits.component.html',
    providers: [
        {
            provide: DateAdapter,
            useClass: MomentDateAdapter,
            deps: [MAT_DATE_LOCALE, MAT_MOMENT_DATE_ADAPTER_OPTIONS]
        },
        {provide: MAT_DATE_FORMATS, useValue: MY_FORMATS}
    ],
    styleUrls: ['./client-visits.component.scss']
})
export class ClientVisitsComponent implements OnInit {
    @ViewChild(MatPaginator) paginator: MatPaginator;
    @ViewChild(MatSort) sort: MatSort;

    clientDTO: ClientDTO = new ClientDTO()
    visitsToVenuesDatasource: MatTableDataSource<VisitToVenueDTO>
    displayedColumns: string[] = ['NFC_ID','venue_name','venue_desc','venue_floor','entry_datetime','exit_datetime']
    Auxiliary = Auxiliary

    //Filtered Variables
    selectedDate = ""

    clientVisitsFiltersFormGroup = new FormGroup({
        date: new FormControl()
    });

    constructor(private baseService: BaseService, private router: Router) {
    }

    ngOnInit(): void {
        this.clientDTO = history.state.data

        this.onFilterChanges()
        this.updateTable()
    }

    AfterViewInit() {
    }

    onFilterChanges() {
        this.clientVisitsFiltersFormGroup.valueChanges.subscribe(formValues => {
            if (formValues.date != null) {
                this.selectedDate = moment(new Date(formValues.date)).format("YYYY-MM-DD");
            }
            
            this.updateTable()
        })
    }

    updateTable() {
        this.baseService.getClientVisits(this.clientDTO.NFC_ID,this.selectedDate).subscribe(
            response => {
                console.log(response)
                this.visitsToVenuesDatasource = new MatTableDataSource(JSON.parse(JSON.stringify(response)))
                this.visitsToVenuesDatasource.sort = this.sort;
                this.visitsToVenuesDatasource.paginator = this.paginator
            }
        )
    }

    ngOnDestroy() {
    }

    navigateToPossibleInfections() {
        this.router.navigate(['/clients/possible-infections'], { state: {data: this.clientDTO} });
    }
}
