import { Component, OnInit } from '@angular/core';

declare interface SidebarRouteInfo {
    path: string;
    title: string;
    icon: string;
}

export const SIDEBAR_ROUTES: SidebarRouteInfo[] = [
    { path: '/clients', title: 'Clients',  icon: 'text_snippet'},
    { path: '/visits-to-services', title: 'Visits To Services',  icon: 'text_snippet'},
    { path: '/usage', title: 'Usage',  icon: 'text_snippet'},
];

@Component({
  selector: 'sidebar',
  templateUrl: './sidebar.component.html',
  styleUrls: ['./sidebar.component.scss']
})
export class SidebarComponent implements OnInit {
  sidebarRoutes: SidebarRouteInfo[];

  constructor() { }

  ngOnInit(): void {
      this.sidebarRoutes = SIDEBAR_ROUTES.map(e => e)
  }

}
