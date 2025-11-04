import { Component, EventEmitter, Input, Output } from '@angular/core';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { ToastrService } from 'ngx-toastr';
import { SIDEBAR } from 'src/app/config/config';
import { RolesService } from '../service/roles.service';

@Component({
  selector: 'app-edit-roles',
  templateUrl: './edit-roles.component.html',
  styleUrls: ['./edit-roles.component.scss']
})
export class EditRolesComponent {

  @Output() RoleE: EventEmitter<any> = new EventEmitter();

  @Input() ROLE_SELECTED: any;

  name: string = '';

  isLoading: any;

  SIDEBAR: any = SIDEBAR;
  constructor(public modal: NgbActiveModal, public roleService: RolesService, public toast: ToastrService) {

  }

  permisions: any = [];

  ngOnInit(): void {
    this.name = this.ROLE_SELECTED.name;
    this.permisions = this.ROLE_SELECTED.permission_pluck;
  }


  addPermission(permiso: string) {
    let INDEX = this.permisions.findIndex((perm: string) => perm == permiso);

    if (INDEX != -1) {
      this.permisions.splice(INDEX, 1)
    }
    else {
      this.permisions.push(permiso);
    }


  }
  store() {

    if (!this.name) {
      this.toast.error("Validación", "El nombre es requerido");
      return false;
    }
    if (!this.permisions || this.permisions.length === 0) {
      this.toast.error("Validación", "Debe seleccionar al menos un permiso");
      return false;
    }

    let data = {
      name: this.name,
      permisions: this.permisions,
    }

    this.roleService.updateRole(this.ROLE_SELECTED.id,data).subscribe((resp: any) => {
      console.log(resp);
      if (resp.message == 403) {
        this.toast.error("Validación", resp.message_text);
      }
      else {
        this.toast.success("Exito", "El rol se edito correctamente");
        this.RoleE.emit(resp.role);
        this.modal.close();
      }

    });
  }

}
