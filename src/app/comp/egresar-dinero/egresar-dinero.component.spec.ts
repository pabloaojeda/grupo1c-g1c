import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EgresarDineroComponent } from './egresar-dinero.component';

describe('EgresarDineroComponent', () => {
  let component: EgresarDineroComponent;
  let fixture: ComponentFixture<EgresarDineroComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ EgresarDineroComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(EgresarDineroComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
