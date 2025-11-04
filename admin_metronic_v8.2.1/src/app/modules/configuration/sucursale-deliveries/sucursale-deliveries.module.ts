import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { SucursaleDeliveriesRoutingModule } from './sucursale-deliveries-routing.module';
import { CreateSucursaleDeliverieComponent } from './create-sucursale-deliverie/create-sucursale-deliverie.component';
import { EditSucursaleDeliverieComponent } from './edit-sucursale-deliverie/edit-sucursale-deliverie.component';
import { DeleteSucursaleDeliverieComponent } from './delete-sucursale-deliverie/delete-sucursale-deliverie.component';
import { ListSucursaleDeliverieComponent } from './list-sucursale-deliverie/list-sucursale-deliverie.component';
import { HttpClientModule } from '@angular/common/http';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { NgbModalModule, NgbModule, NgbPaginationModule } from '@ng-bootstrap/ng-bootstrap';
import { InlineSVGModule } from 'ng-inline-svg-2';


@NgModule({
  declarations: [
    CreateSucursaleDeliverieComponent,
    EditSucursaleDeliverieComponent,
    DeleteSucursaleDeliverieComponent,
    ListSucursaleDeliverieComponent
  ],
  imports: [
    CommonModule,
    SucursaleDeliveriesRoutingModule,

    HttpClientModule,
    FormsModule,
    NgbModule,
    ReactiveFormsModule,
    InlineSVGModule,
    NgbModalModule,
    NgbPaginationModule,
  ]
})
export class SucursaleDeliveriesModule { }
