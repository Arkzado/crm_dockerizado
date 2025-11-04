import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { SucursaleDeliveriesComponent } from './sucursale-deliveries.component';
import { ListSucursaleDeliverieComponent } from './list-sucursale-deliverie/list-sucursale-deliverie.component';

const routes: Routes = [{
  path: '',
  component: SucursaleDeliveriesComponent,
  children: [{
    path: 'list',
    component: ListSucursaleDeliverieComponent,
  }]
}];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class SucursaleDeliveriesRoutingModule { }
