import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { DashboardRoutingModule } from './dashboard-routing.module';
import { MaterialModule } from 'src/app/config/modules/material.module';
import { ComponentsModule } from 'src/app/components/components.module';
import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { ServicesComponent } from 'src/app/pages/services/services.component';
import { ClientsComponent } from 'src/app/pages/clients/clients.component';
import { ClientVisitsComponent } from 'src/app/pages/clients/client-visits/client-visits.component';
import { PossibleInfectionsComponent } from 'src/app/pages/clients/possible-infections/possible-infections.component';
import { UsageComponent } from 'src/app/pages/usage/usage.component';


@NgModule({
    declarations: [
        ClientsComponent,
        ClientVisitsComponent,
        PossibleInfectionsComponent,
        ServicesComponent,
        UsageComponent
    ],
    imports: [
        CommonModule,
        DashboardRoutingModule,
        ComponentsModule,
        MaterialModule
    ]
})
export class DashboardModule { }
