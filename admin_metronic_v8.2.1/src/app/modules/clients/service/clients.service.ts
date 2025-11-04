import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, BehaviorSubject, finalize } from 'rxjs';
import { URL_SERVICIOS } from 'src/app/config/config';
import { AuthService } from 'src/app/modules/auth';

@Injectable({
  providedIn: 'root'
})
export class ClientsService {
  isLoading$: Observable<boolean>;
  isLoadingSubject: BehaviorSubject<boolean>;

  constructor(
    private http: HttpClient,
    public authService: AuthService,
  ) {
    this.isLoadingSubject = new BehaviorSubject<boolean>(false);
    this.isLoading$ = this.isLoadingSubject.asObservable();
  }

  registerClient(data: any) {
    this.isLoadingSubject.next(true);
    let headers = new HttpHeaders({ 'Authorization': 'Bearer ' + this.authService.token });
    let URL = URL_SERVICIOS + '/clients';
    return this.http.post(URL, data, { headers: headers }).pipe(
      finalize(() => this.isLoadingSubject.next(false))
    );
  }

  
  importClient(data:any) {
    this.isLoadingSubject.next(true);
    let headers = new HttpHeaders({'Authorization': 'Bearer '+ this.authService.token});
    let URL = URL_SERVICIOS+"/clients/import";
    return this.http.post(URL,data,{headers: headers}).pipe(
      finalize(() => this.isLoadingSubject.next(false))
    );
  }

  registerActivityClient(data: any) {
     this.isLoadingSubject.next(true);
    let headers = new HttpHeaders({ 'Authorization': 'Bearer ' + this.authService.token });
    let URL = URL_SERVICIOS + '/activities';
    return this.http.post(URL, data, { headers: headers }).pipe(
      finalize(() => this.isLoadingSubject.next(false))
    );
  };

  listConfig() {
  this.isLoadingSubject.next(true);
  let headers = new HttpHeaders({'Authorization': 'Bearer ' + this.authService.token});
  let URL = URL_SERVICIOS + "/clients/config";
  return this.http.get(URL, {headers: headers}).pipe(
    finalize(() => this.isLoadingSubject.next(false))
  );
}

listClients(page = 1, data:any = {}) {
  this.isLoadingSubject.next(true);
  let headers = new HttpHeaders({'Authorization': 'Bearer ' + this.authService.token});
  let URL = URL_SERVICIOS + "/clients/index?page=" + page;
  return this.http.post(URL,data, {headers: headers}).pipe(
    finalize(() => this.isLoadingSubject.next(false))
  );
}

listUsers() {
  this.isLoadingSubject.next(true);
  let headers = new HttpHeaders({'Authorization': 'Bearer ' + this.authService.token});
  let URL = URL_SERVICIOS + "/users/list-users";
  return this.http.get(URL, {headers: headers}).pipe(
    finalize(() => this.isLoadingSubject.next(false))
  );
}

updateClient(ID_CLIENT_SEGMENT: string, data: any) {
  this.isLoadingSubject.next(true);
  let headers = new HttpHeaders({'Authorization': 'Bearer ' + this.authService.token});
  let URL = URL_SERVICIOS + "/clients/" + ID_CLIENT_SEGMENT;
  return this.http.put(URL, data, {headers: headers}).pipe(
    finalize(() => this.isLoadingSubject.next(false))
  );
}

deleteClient(ID_CLIENT_SEGMENT: string) {
  this.isLoadingSubject.next(true);
  let headers = new HttpHeaders({'Authorization': 'Bearer ' + this.authService.token});
  let URL = URL_SERVICIOS + "/clients/" + ID_CLIENT_SEGMENT;
  return this.http.delete(URL, {headers: headers}).pipe(
    finalize(() => this.isLoadingSubject.next(false))
  );
}

}