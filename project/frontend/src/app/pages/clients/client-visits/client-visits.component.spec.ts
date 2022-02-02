import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ClientVisitsComponent } from './client-visits.component';

describe('ClientVisitsComponent', () => {
  let component: ClientVisitsComponent;
  let fixture: ComponentFixture<ClientVisitsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ClientVisitsComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ClientVisitsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
