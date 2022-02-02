import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PossibleInfectionsComponent } from './possible-infections.component';

describe('PossibleInfectionsComponent', () => {
  let component: PossibleInfectionsComponent;
  let fixture: ComponentFixture<PossibleInfectionsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ PossibleInfectionsComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(PossibleInfectionsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
