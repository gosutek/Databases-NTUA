import { Component, OnInit, ViewChild } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { ServiceUsageDTO } from 'src/app/dto/service-usage-dto';
import { VenueUsageDTO } from 'src/app/dto/venue-usage-dto';
import { BaseService } from 'src/app/services/base.service';
import { Auxiliary } from 'src/app/utils/auxiliary';

@Component({
  selector: 'app-usage',
  templateUrl: './usage.component.html',
  styleUrls: ['./usage.component.scss']
})
export class UsageComponent implements OnInit {
    @ViewChild(MatPaginator) paginator: MatPaginator;
    @ViewChild(MatSort) sort: MatSort;

    venueUsageDatasource: MatTableDataSource<VenueUsageDTO>
    serviceUsageDatasource: MatTableDataSource<ServiceUsageDTO>
    displayedColumnsVenues: string[] = ['venue_id', 'venue_name', 'venue_floor','number_of_visits']
    displayedColumnsServices: string[] = ['service_id', 'service_desc', 'number_of_visits']
    Auxiliary = Auxiliary

    //Filtered Variables
    selectedTimeRange = "month"
    selectedAge = ""
    selectedUsage = "venues"

    usageFiltersFormGroup = new FormGroup({
        time_range: new FormControl('month'),
        age: new FormControl(''),
        usage: new FormControl('venues')
    });

    constructor(private baseService: BaseService) {
    }

    ngOnInit(): void {
        this.onFilterChanges()
        this.updateTable()
    }

    updateTable() {
        if (this.selectedUsage == "venues") {
            this.baseService.getMostUsedVenues(this.selectedTimeRange,this.selectedAge).subscribe(
                response => {
                    console.log(response)
                    this.venueUsageDatasource = new MatTableDataSource(JSON.parse(JSON.stringify(response)))
                    this.venueUsageDatasource.sort = this.sort;
                    this.venueUsageDatasource.paginator = this.paginator
                }
            )
        } else if (this.selectedUsage == "services") {
            this.baseService.getMostUsedServices(this.selectedTimeRange,this.selectedAge).subscribe(
                response => {
                    console.log(response)
                    this.serviceUsageDatasource = new MatTableDataSource(JSON.parse(JSON.stringify(response)))
                    this.serviceUsageDatasource.sort = this.sort;
                    this.serviceUsageDatasource.paginator = this.paginator
                }
            )

        } else if (this.selectedUsage == "services_unique_clients") {
            this.baseService.getUniqueServiceUses(this.selectedTimeRange,this.selectedAge).subscribe(
                response => {
                    console.log(response)
                    this.serviceUsageDatasource = new MatTableDataSource(JSON.parse(JSON.stringify(response)))
                    this.serviceUsageDatasource.sort = this.sort;
                    this.serviceUsageDatasource.paginator = this.paginator
                }
            )
        }
    }

    onFilterChanges() {
        this.usageFiltersFormGroup.valueChanges.subscribe(formValues => {
            if (formValues.time_range != null) {
                this.selectedTimeRange = formValues.time_range
            }

            if (formValues.age != null) {
                this.selectedAge = formValues.age
            }

            if (formValues.usage != null) {
                this.selectedUsage = formValues.usage
            }

            this.updateTable();
        })
    }

}
