import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { WarehousesRoutingModule } from './warehouse-routing.module';
import { WarehouseComponent } from './warehouse.component';
import { CreateWarehouseComponent } from './create-warehouse/create-warehouse.component';
import { EditWarehouseComponent } from './edit-warehouse/edit-warehouse.component';
import { DeleteWarehouseComponent } from './delete-warehouse/delete-warehouse.component';
import { ListWherehouseComponent } from './list-warehouse/list-warehouse.component';
import { HttpClientModule } from '@angular/common/http';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { NgbModule, NgbModalModule, NgbPaginationModule } from '@ng-bootstrap/ng-bootstrap';
import { InlineSVGModule } from 'ng-inline-svg-2';


@NgModule({
  declarations: [
    WarehouseComponent,
    CreateWarehouseComponent,
    EditWarehouseComponent,
    DeleteWarehouseComponent,
    ListWherehouseComponent
  ],
  imports: [
    CommonModule,
    WarehousesRoutingModule,
    
    HttpClientModule,
    FormsModule,
    NgbModule,
    ReactiveFormsModule,
    InlineSVGModule,
    NgbModalModule,
    NgbPaginationModule,
  ]
})
export class WarehousesModule { }
