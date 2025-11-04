import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { WarehouseComponent } from './warehouse.component';
import { ListWherehouseComponent } from './list-warehouse/list-warehouse.component';

const routes: Routes = [
  {
    path: '',
    component: WarehouseComponent,
    children: [
      {
        path: 'list',
        component: ListWherehouseComponent
      }
    ]
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class WarehousesRoutingModule { }
