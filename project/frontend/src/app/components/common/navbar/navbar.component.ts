import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Location } from '@angular/common';
import { SIDEBAR_ROUTES } from '../sidebar/sidebar.component';
import { Subscription } from 'rxjs/internal/Subscription';

@Component({
  selector: 'navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.scss']
})
export class NavbarComponent implements OnInit {
    private listBasePaths: any[]
    location: Location
    updateEmmiterSubscription: Subscription

    constructor(location: Location, private router: Router) {
        this.location = location;
    }

    ngOnInit(): void {
        this.listBasePaths = SIDEBAR_ROUTES.map(e => e)
    }

    onUpdateSignal() {
    }

    getTitle(){
		let currentPath = this.location.prepareExternalUrl(this.location.path());
		for(var item = 0; item < this.listBasePaths.length; item++){
			if(this.listBasePaths[item].path === currentPath || currentPath.search(`\\${this.listBasePaths[item].path}\\/`) >= 0){
				return this.listBasePaths[item].title;
			}
		}

        return ""
    }

    logoutUser() {
        // this.router.navigateByUrl(`/login`);
    }

    ngOnDestroy() {
    }
}
