import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PermissionsModalComponent } from './permissions-modal.component';

describe('PermissionsModalComponent', () => {
  let component: PermissionsModalComponent;
  let fixture: ComponentFixture<PermissionsModalComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [PermissionsModalComponent]
    });
    fixture = TestBed.createComponent(PermissionsModalComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
