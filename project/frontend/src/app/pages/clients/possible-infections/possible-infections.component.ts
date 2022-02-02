import { Component, OnInit, ViewChild } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { Router } from '@angular/router';
import { ClientDTO } from 'src/app/dto/client-dto';
import { BaseService } from 'src/app/services/base.service';

@Component({
  selector: 'app-possible-infections',
  templateUrl: './possible-infections.component.html',
  styleUrls: ['./possible-infections.component.scss']
})
export class PossibleInfectionsComponent implements OnInit {
    @ViewChild(MatPaginator) paginator: MatPaginator;
    @ViewChild(MatSort) sort: MatSort;

    clientDTO: ClientDTO = new ClientDTO()
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

    constructor(private baseService: BaseService) {
    }

    ngOnInit(): void {
        this.clientDTO = history.state.data

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
        this.baseService.getPossibleInfections(this.clientDTO.NFC_ID,this.selectedFirstName,this.selectedLastName,this.selectedIdNo).subscribe(
            response => {
                this.clientsDatasource = new MatTableDataSource(JSON.parse(JSON.stringify(response)))
                this.clientsDatasource.sort = this.sort;
                this.clientsDatasource.paginator = this.paginator
            }
        )
    }

    ngOnDestroy() {
    }
}
