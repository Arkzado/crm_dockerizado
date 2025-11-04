import { Component, EventEmitter, Input, Output } from '@angular/core';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { SucursaleDeliverieService } from '../service/sucursale-deliverie.service';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-delete-sucursale-deliverie',
  templateUrl: './delete-sucursale-deliverie.component.html',
  styleUrls: ['./delete-sucursale-deliverie.component.scss']
})
export class DeleteSucursaleDeliverieComponent {

  
    @Output() SucursalDeliverieD: EventEmitter<any> = new EventEmitter();
    @Input()  SUCURSAL_SELECTED:any;
  
    isLoading:any;
    constructor(
      public modal: NgbActiveModal,
      public sucursalesDeliverieService: SucursaleDeliverieService,
      public toast: ToastrService,
    ) {
      
    }
  
    ngOnInit(): void {
    }
  
    delete(){
      
      this.sucursalesDeliverieService.deleteSucursalDeliverie(this.SUCURSAL_SELECTED.id).subscribe((resp:any) => {
        console.log(resp);
        if(resp.message == 403){
          this.toast.error("Validación",resp.message_text);
        }else{
          this.toast.success("Exito","La sucursal se elimino correctamente");
          this.SucursalDeliverieD.emit(resp.message);
          this.modal.close();
        }
      })
    }
  
}
