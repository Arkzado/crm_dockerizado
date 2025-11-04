import { Component } from '@angular/core';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { ActivitiesService } from './service/activities.service';
import { ToastrService } from 'ngx-toastr';


@Component({
  selector: 'app-activities',
  templateUrl: './activities.component.html',
  styleUrls: ['./activities.component.scss']
})
export class ActivitiesComponent {
  search: string = '';
  ACTIVIDADES: any = [];
  isLoading$: any;
  


  
  totalPages: number = 0;
  currentPage: number = 1;
  

  constructor(
      public modalService: NgbModal,
      public activitiesService: ActivitiesService,
    public toast: ToastrService

    ) {}

  ngOnInit(): void {
    this.isLoading$ = this.activitiesService.isLoading$;
    this.listActivities();
   
  }

  listActivities() {
    this.activitiesService.listActivitys().subscribe((resp: any) => {
      console.log(resp);
      // keep same pattern as other list components: resp.activities or resp.activities.data
      this.ACTIVIDADES = resp?.activities?.data ?? resp?.activities ?? [];
       

    });
  }

  completeActivity(id: string) {
    let data = {
      status: 2,
    };

    this.activitiesService.updateActivitys(id,data).subscribe((resp: any) => {
      this.toast.success('Actividad registrada con éxito', 'Éxito');
      this.listActivities();
    });
  }

  deleteActivity(id: string) {
    this.activitiesService.deleteActivitys(id).subscribe((resp: any)=>{
      this.toast.success('Actividad eliminada con exito', 'Éxito');
      this.listActivities();
    });
  }

  loadPage($event: any) {
    this.listActivities();
  }
}
