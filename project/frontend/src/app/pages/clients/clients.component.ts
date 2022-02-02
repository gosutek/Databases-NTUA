import { Component, OnInit, ViewChild } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { FrontendEnums } from 'src/app/config/app-constants';
import * as moment from 'moment'
import { Subscription } from 'rxjs/internal/Subscription';
import { BaseService } from 'src/app/services/base.service';
import { ClientDTO } from 'src/app/dto/client-dto';
import { Router } from '@angular/router';

@Component({
    selector: 'clients',
    templateUrl: './clients.component.html',
    styleUrls: ['./clients.component.scss']
})
export class ClientsComponent implements OnInit {
    @ViewChild(MatPaginator) paginator: MatPaginator;
    @ViewChild(MatSort) sort: MatSort;

    clientsDatasource: MatTableDataSource<ClientDTO>
    displayedColumns: string[] = ['NFC_ID','first_name','last_name','id_no','emails','phones']

    //Filtered Variables
    selectedFirstName = ""
    selectedLastName = ""
    selectedIdNo = ""

    clientFiltersFormGroup = new FormGroup({
        firstName: new FormControl(),
        lastName: new FormControl(),
        idNo: new FormControl()
    });

    constructor(private baseService: BaseService, private router: Router) {
    }

    ngOnInit(): void {
        this.onFilterChanges()
        this.updateTable()
    }

    onFilterChanges() {
        this.clientFiltersFormGroup.valueChanges.subscribe(formValues => {
            if (formValues.firstName != null) {
                this.selectedFirstName = formValues.firstName
            }

            if (formValues.lastName != null) {
                this.selectedLastName = formValues.lastName
            }

            if (formValues.idNo != null) {
                this.selectedIdNo = formValues.idNo
            }
        })
    }

    updateTable() {
        this.baseService.getClients(this.selectedFirstName,this.selectedLastName,this.selectedIdNo).subscribe(
            response => {
                this.clientsDatasource = new MatTableDataSource(JSON.parse(JSON.stringify(response)))
                this.clientsDatasource.sort = this.sort;
                this.clientsDatasource.paginator = this.paginator
            }
        )
    }

    navigateToClientVisits(row) {
        this.router.navigate(['/clients/client-visits'], { state: {data: row} });
    }

    ngOnDestroy() {
    }

}
