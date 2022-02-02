import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { NavbarComponent } from './common/navbar/navbar.component';
import { SidebarComponent } from './common/sidebar/sidebar.component';
import { MaterialModule } from '../config/modules/material.module';
import { RouterModule } from '@angular/router';

@NgModule({
  declarations: [
      NavbarComponent,
      SidebarComponent
  ],
  imports: [
    CommonModule,
    RouterModule,
    MaterialModule
  ],
  exports: [
      NavbarComponent,
      SidebarComponent
  ]
})
export class ComponentsModule { }
