import { Component, EventEmitter, Input, Output } from '@angular/core';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { ToastrService } from 'ngx-toastr';
import { UBIGEO_REGIONES } from 'src/app/config/ubigeo_departamentos';
import { UBIGEO_MUNICIPIO } from 'src/app/config/ubigeo_municipios';
import { ClientsService } from '../service/clients.service';

@Component({
  selector: 'app-create-clients-company',
  templateUrl: './create-clients-company.component.html',
  styleUrls: ['./create-clients-company.component.scss']
})
export class CreateClientsCompanyComponent {
   @Output() ClientsC: EventEmitter<any> = new EventEmitter();
  
    @Input() client_segments: any = [];
    @Input() asesores: any = [];
  
    client_segment_id: string = '';
    
    full_name:string = '';
    type_document: string = 'NIT';
    n_document: number = 0;
    origen: string = '';
    sexo: string = '';
    birthdate: any = null;
    phone: number = 0;
    email: string = '';
    asesor_id: string = '';
  
    DEPARTAMENTOS: any = UBIGEO_REGIONES;
    MUNICIPIOS: any = UBIGEO_MUNICIPIO;
    MUNICIPIOS_SELECTEDS: any = [];
    tab_selected: number = 1;
    ubigeo_departamento: string = '';
    ubigeo_municipio: string = '';
    departamento: string = '';
    municipio: string = '';
    address: string = '';
    is_parcial: boolean = false;
    isLoading: any;
  
    constructor(
      public modal: NgbActiveModal,
      public clientsService: ClientsService,
      public toast: ToastrService
    ) {}
  
    ngOnInit(): void {
      //Called after the constructor, initializing input properties, and the first call to ngOnChanges.
      //Add 'implements OnInit' to the class.
    }
  
    changeDepartamento($event: any) {
      let DEPARTAMENTO_ID = $event.target.value;
      let DEPARTAMENTO_SELECTED = this.DEPARTAMENTOS.find(
        (departamento: any) => departamento.id == DEPARTAMENTO_ID
      );
      if (DEPARTAMENTO_SELECTED) {
        this.departamento = DEPARTAMENTO_SELECTED.name;
      }
      let municipios = this.MUNICIPIOS.filter(
        (municipio: any) => municipio.department_id == DEPARTAMENTO_ID
      );
      this.MUNICIPIOS_SELECTEDS = municipios;
    }
  
    changeMunicipio($event: any) {
      let MUNICIPIO_ID = $event.target.value;
      let MUNICIPIO_SELECTED = this.MUNICIPIOS.find(
        (municipio: any) => municipio.id == MUNICIPIO_ID
      );
      if (MUNICIPIO_SELECTED) {
        this.municipio = MUNICIPIO_SELECTED.name;
      }
    }
  
    selectedTab(val: number) {
      this.tab_selected = val;
    }
  
    selectedParcialC() {
      this.is_parcial = this.is_parcial == false ? true : false;
    }
  
    store() {
      if (
        !this.full_name ||
        !this.type_document ||
        !this.n_document ||
        !this.origen ||
        !this.birthdate ||
        !this.phone ||
        !this.ubigeo_departamento ||
        !this.ubigeo_municipio ||
        !this.address
      ) {
        this.toast.error("Validacion, Debes completar todos los campos con el signo (*)");
        return false;
      }
  
      let data = {
        
        full_name: this.full_name,
        client_segment_id: this.client_segment_id,
        type_document: this.type_document,
        n_document: this.n_document,
        origen: this.origen,
        birthdate: this.birthdate,
        phone: this.phone,
        asesor_id: this.asesor_id,
        ubigeo_departamento: this.ubigeo_departamento,
        ubigeo_municipio: this.ubigeo_municipio,
        departamento: this.departamento,
        municipio: this.municipio,
        address: this.address,
        is_parcial: this.is_parcial ? 2 : 1,
        type: 2,
        state: 1,
      };
      
  
      this.clientsService.registerClient(data).subscribe((resp: any) => {
       
        if (resp.message == 403) {
          this.toast.error('Validación', resp.message_text);
        } else {
          this.toast.success(
            'Exito',
            'El cliente se registro con exito correctamente'
          );
          this.ClientsC.emit(resp.client);
          this.modal.close();
        }
      });
    }
}
