import { Component, EventEmitter, Output } from '@angular/core';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';

import { SucursaleDeliverieService } from '../service/sucursale-deliverie.service';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-create-sucursale-deliverie',
  templateUrl: './create-sucursale-deliverie.component.html',
  styleUrls: ['./create-sucursale-deliverie.component.scss']
})
export class CreateSucursaleDeliverieComponent {

  @Output() SucursalDeliverieC: EventEmitter<any> = new EventEmitter();
  name:string = '';
  address:string = '';

  isLoading:any;

  constructor(
    public modal: NgbActiveModal,
    public sucursalDeliverieService: SucursaleDeliverieService,
    public toast: ToastrService,
  ) {
    
  }

  ngOnInit(): void {
    //Called after the constructor, initializing input properties, and the first call to ngOnChanges.
    //Add 'implements OnInit' to the class.
    
  }

  store(){
    if(!this.name){
      this.toast.error("Validación","El nombre del lugar de entrega es requerido");
      return false;
    }

    let data = {
      name: this.name,
      address:this.address,
    }

    this.sucursalDeliverieService.registerSucursalDeliverie(data).subscribe((resp:any) => {
      console.log(resp);
      if(resp.message == 403){
        this.toast.error("Validación",resp.message_text);
      }else{
        this.toast.success("Exito","El lugar de entrega se registro correctamente");
        this.SucursalDeliverieC.emit(resp.sucursal_deliveries);
        this.modal.close();
      }
    })
  }
}
