import { Component } from '@angular/core';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { CreateRolesComponent } from '../create-roles/create-roles.component';
import { PermissionsModalComponent } from 'src/app/shared/components/permissions-modal/permissions-modal.component';
import { RolesService } from '../service/roles.service';
import { EditRolesComponent } from '../edit-roles/edit-roles.component';
import { DeleteRolesComponent } from '../delete-roles/delete-roles.component';

@Component({
  selector: 'app-list-roles',
  templateUrl: './list-roles.component.html',
  styleUrls: ['./list-roles.component.scss']
})
export class ListRolesComponent {

  search: string = '';
  ROLES: any = [];
  isLoading$: any;

  totalPages: number = 0;
  currentPage: number = 1;
  constructor(
    public modalService: NgbModal, public rolesService: RolesService,
  ) {


  }

  ngOnInit(): void {
    this.isLoading$ = this.rolesService.isLoading$;
    this.listRoles();
  }

  openPermissionsModal(ROL: any) {
    const modalRef = this.modalService.open(PermissionsModalComponent, { centered: true, size: 'lg' });
    modalRef.componentInstance.ROL = ROL;
  }

  listRoles(page = 1) {
    this.rolesService.listRoles(page, this.search).subscribe((resp: any) => {

      resp.roles.forEach((rol: any) => {

        if (rol.permission_pluck && Array.isArray(rol.permission_pluck)) {
          rol.permissions_array = rol.permission_pluck;
        } else {

          rol.permissions_array = [];
        }

      });

      this.ROLES = resp.roles;
      this.totalPages = resp.total;
      this.currentPage = page;
    })
  }

  loadPage($event: any) {
    this.listRoles($event);
  }

  createRol() {
    const modalRef = this.modalService.open(CreateRolesComponent, { centered: true, size: 'md' });

    modalRef.componentInstance.RoleC.subscribe((role: any) => {

      if (role.permission_pluck && Array.isArray(role.permission_pluck)) {
        role.permissions_array = role.permission_pluck;
      } else {
        role.permissions_array = [];
      }
      this.ROLES.unshift(role);
    });
  }

  editRole(ROL: any) {
    const modalRef = this.modalService.open(EditRolesComponent, { centered: true, size: 'md' });
    modalRef.componentInstance.ROLE_SELECTED = ROL;

    modalRef.componentInstance.RoleE.subscribe((role: any) => {

      if (role.permission_pluck && Array.isArray(role.permission_pluck)) {
        role.permissions_array = role.permission_pluck;
      } else {
        role.permissions_array = [];
      }

      const index = this.ROLES.findIndex((rol: any) => rol.id == ROL.id);

      if (index != -1) {

        const newRoles = [...this.ROLES];
        newRoles[index] = role;
        this.ROLES = newRoles;

      }
    })

  }

  deleteRole(ROL: any) {
    const modalRef = this.modalService.open(DeleteRolesComponent, { centered: true, size: 'md' });
    modalRef.componentInstance.ROLE_SELECTED = ROL;

    modalRef.componentInstance.RoleD.subscribe((role: any) => {


      const index = this.ROLES.findIndex((rol: any) => rol.id == ROL.id);

      if (index != -1) {

        this.ROLES.splice(index, 1);

      }
    })

  }
}

