import { Component } from '@angular/core';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { SucursaleDeliverieService } from '../service/sucursale-deliverie.service';
import { CreateSucursaleDeliverieComponent } from '../create-sucursale-deliverie/create-sucursale-deliverie.component';
import { EditSucursaleDeliverieComponent } from '../edit-sucursale-deliverie/edit-sucursale-deliverie.component';
import { DeleteSucursaleDeliverieComponent } from '../delete-sucursale-deliverie/delete-sucursale-deliverie.component';

@Component({
  selector: 'app-list-sucursale-deliverie',
  templateUrl: './list-sucursale-deliverie.component.html',
  styleUrls: ['./list-sucursale-deliverie.component.scss'],
})
export class ListSucursaleDeliverieComponent {
  search: string = '';
  SUCURSALES_DELIVERIES: any[] = [];
  isLoading$: any;

  totalPages: number = 0;
  currentPage: number = 1;
  constructor(
    public modalService: NgbModal,
    public sucursalDeliverieService: SucursaleDeliverieService
  ) {}

  ngOnInit(): void {
    //Called after the constructor, initializing input properties, and the first call to ngOnChanges.
    //Add 'implements OnInit' to the class.
    this.isLoading$ = this.sucursalDeliverieService.isLoading$;
    this.listSucursaleDeliveries();
  }

  listSucursaleDeliveries(page = 1) {
    this.sucursalDeliverieService
      .listSucursaleDeliveries(page, this.search)
      .subscribe((resp: any) => {
        console.log(resp);
        this.SUCURSALES_DELIVERIES = resp.sucursal_deliveries;
        this.totalPages = resp.total;
        this.currentPage = page;
      });
  }

  loadPage($event: any) {
    this.listSucursaleDeliveries($event);
  }

  createSucursalDeliverie() {
    const modalRef = this.modalService.open(CreateSucursaleDeliverieComponent, {
      centered: true,
      size: 'md',
    });

    modalRef.componentInstance.SucursalDeliverieC.subscribe(
      (sucursal_deliveries: any) => {
        this.SUCURSALES_DELIVERIES.unshift(sucursal_deliveries);
      }
    );
  }

  editSucursalDeliverie(SUCURSALES_DELIVERIES: any) {
    const modalRef = this.modalService.open(EditSucursaleDeliverieComponent, {
      centered: true,
      size: 'md',
    });
    modalRef.componentInstance.SUCURSAL_SELECTED = SUCURSALES_DELIVERIES;

    modalRef.componentInstance.SucursalDeliverieE.subscribe(
      (sucursal_deliveries: any) => {
        let INDEX = this.SUCURSALES_DELIVERIES.findIndex(
          (sucurs: any) => sucurs.id == SUCURSALES_DELIVERIES.id
        );
        if (INDEX != -1) {
          this.SUCURSALES_DELIVERIES[INDEX] = sucursal_deliveries;
        }
      }
    );
  }

  deleteSurcusalDeliverie(SUCURSAL: any) {
    const modalRef = this.modalService.open(DeleteSucursaleDeliverieComponent, {
      centered: true,
      size: 'md',
    });
    modalRef.componentInstance.SUCURSAL_SELECTED = SUCURSAL;

    modalRef.componentInstance.SucursalDeliverieD.subscribe(
      (sucursale_deliveries: any) => {
        let INDEX = this.SUCURSALES_DELIVERIES.findIndex(
          (sucurs: any) => sucurs.id == SUCURSAL.id
        );
        if (INDEX != -1) {
          this.SUCURSALES_DELIVERIES.splice(INDEX, 1);
        }
        // this.ROLES.unshift(role);
      }
    );
  }
}
