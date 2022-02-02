import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { DashboardComponent } from './layouts/dashboard/dashboard.component';

const routes: Routes =[
    { path: '', component: DashboardComponent, children: [{ path: '', loadChildren: () => import('src/app/layouts/dashboard/dashboard.module').then(m => m.DashboardModule) }] },
    { path: '**', redirectTo: '', pathMatch: 'full' }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
