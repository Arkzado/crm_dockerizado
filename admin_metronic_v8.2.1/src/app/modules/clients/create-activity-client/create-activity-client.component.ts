import { Component } from '@angular/core';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { ToastrService } from 'ngx-toastr';
import { ClientsService } from '../service/clients.service';

@Component({
  selector: 'app-create-activity-client',
  templateUrl: './create-activity-client.component.html',
  styleUrls: ['./create-activity-client.component.scss']
})
export class CreateActivityClientComponent {
  

  isLoading$: any;
    clients: any = [];
    users: any = [];

  subject:string = '';
  type: string = '';
  due_date: any = null;
  notes: string = '';
  client_id: number = 0; 
  user_id: number = 0; 

    isLoading: any;

constructor(
  public modal: NgbActiveModal,
  public clientsService: ClientsService,
  public toast: ToastrService
  ) {}


   ngOnInit(): void {
    // Called after the constructor, initializing input properties, and the first call to ngOnChanges.
    // Add 'implements OnInit' to the class.
    this.isLoading$ = this.clientsService.isLoading$;
    this.listClients();
    this.listUsers();
  };

  listClients(page = 1) {
    let data = {
      search:"",
      client_segment_id:"",
      type:"",
      asesor_id:"",

    }
    this.clientsService
      .listClients(page, data)
      .subscribe((resp: any) => {
        this.clients = resp.clients.data;
        
       
      });
  };

  listUsers(){
    this.clientsService.listUsers().subscribe((resp: any) => {
       this.users = resp.users;
    });
  };

  store() {
    if(!this.subject || !this.type || !this.due_date || !this.client_id || !this.user_id){
      this.toast.error('Por favor complete todos los campos requeridos', 'Error');
      return false;
    };

    let data = {
      subject: this.subject,
      type: this.type,
      due_date: this.due_date,
      notes: this.notes,
      client_id: this.client_id,
      user_id: this.user_id,
    }

    this.clientsService.registerActivityClient(data).subscribe((resp: any) => {
      this.toast.success('Actividad registrada con éxito', 'Éxito');
      this.modal.close();
    })


}
}
