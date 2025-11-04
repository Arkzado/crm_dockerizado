import { Component, EventEmitter, Input, Output } from '@angular/core';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { ToastrService } from 'ngx-toastr';
import { ProductsService } from '../service/products.service';

@Component({
  selector: 'app-delete-product',
  templateUrl: './delete-product.component.html',
  styleUrls: ['./delete-product.component.scss']
})
export class DeleteProductComponent {

  @Output() ProductD: EventEmitter<any> = new EventEmitter();
  @Input()  PRODUCT_SELECTED:any;

  isLoading:any;
  constructor(
    public modal: NgbActiveModal,
    public productService: ProductsService,
    public toast: ToastrService,
  ) {
    
  }

  ngOnInit(): void {
  }

  delete(){
    
    this.productService.deleteProduct(this.PRODUCT_SELECTED.id).subscribe((resp:any) => {
      console.log(resp);
      if(resp.message == 403){
        this.toast.error("Validación",resp.message_text);
      }else{
        this.toast.success("Exito","El cliente se elimino correctamente");
        this.ProductD.emit(resp.message);
        this.modal.close();
      }
    })
  }

}
