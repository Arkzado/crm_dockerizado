import { Component, Input, OnInit } from '@angular/core';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';

@Component({
  selector: 'app-permissions-modal',
  templateUrl: './permissions-modal.component.html',
  styleUrls: ['./permissions-modal.component.scss']
})
export class PermissionsModalComponent implements OnInit {

  @Input() ROL: any;

  groupedPermissions: Record<string, string[]> = {};

  constructor(public modal: NgbActiveModal) { }

  ngOnInit(): void {
    if (this.ROL && this.ROL.permissions_array) {
      this.groupedPermissions = this.groupPermissions(this.ROL.permissions_array);
    }
  }

  groupPermissions(permissions: string[]): Record<string, string[]> {
    const groups: Record<string, string[]> = {};

    permissions.forEach(permission => {
      if (!permission) return;

      const parts = permission.split('_');
      let action: string;
      let module: string;


      if (parts.length < 2) {
        //Modulo con una sola accion
        module = 'General';
        action = parts[0];
      } else {
        //Modulo con varias acciones
        action = parts[0];
        module = parts.slice(1).join('_');
      }

      if (!groups[module]) {
        groups[module] = [];
      }
      groups[module].push(action);
    });

    return groups;
  }
}