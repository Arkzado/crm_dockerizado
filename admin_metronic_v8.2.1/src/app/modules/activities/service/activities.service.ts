import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject, finalize, Observable } from 'rxjs';
import { URL_SERVICIOS } from 'src/app/config/config';
import { AuthService, UserModel } from '../../auth';

@Injectable({
  providedIn: 'root'
})
export class ActivitiesService {
   isLoading$: Observable<boolean>;
  isLoadingSubject: BehaviorSubject<boolean>;


  

  constructor(
      private http: HttpClient,
      public authService: AuthService,
    ) {
      this.isLoadingSubject = new BehaviorSubject<boolean>(false);
      this.isLoading$ = this.isLoadingSubject.asObservable();
    }
  
    /**
     * Devuelve siempre un id numérico o undefined.
     * - Primero intenta extraer un id numérico del JWT (token)
     * - Si no hay id en el token, intenta obtenerlo desde AuthService.currentUserValue
     * - Finalmente, si la cookie de sesión contiene un número, la parsea
     */
    public getSessionId(): number | undefined {
      // 1) try token (JWT) first
      try {
        const token: any = (this.authService && this.authService.token) || undefined;
        if (token && typeof token === 'string') {
          const uid = this.getUserIdFromToken(token);
          if (uid !== undefined) return uid;
        }
      } catch (e) {}

      // 2) try user id exposed by AuthService
      try {
        const user: any = (this.authService && (this.authService.currentUserValue as any)) || (this.authService && (this.authService.user as any));
        if (user) {
          if (user.id !== undefined && user.id !== null) return typeof user.id === 'string' && !isNaN(+user.id) ? +user.id : user.id;
          if (user.user_id !== undefined && user.user_id !== null) return typeof user.user_id === 'string' && !isNaN(+user.user_id) ? +user.user_id : user.user_id;
        }
      } catch (e) {}

      // 3) try cookies and parse numeric value if present
      try {
        const cookies = document.cookie ? document.cookie.split(';').map(c => c.trim()) : [];
        for (const c of cookies) {
          const [k, v] = c.split('=');
          if (!k || v === undefined) continue;
          const key = k.trim();
          const val = decodeURIComponent(v || '').trim();
          // If cookie contains a pure number, return it
          if (/^\d+$/.test(val)) return +val;
          // if cookie is a JWT, try to extract id
          if (/^[A-Za-z0-9_-]+\.[A-Za-z0-9_-]+\.[A-Za-z0-9_-]+$/.test(val)) {
            const uid = this.getUserIdFromToken(val);
            if (uid !== undefined) return uid;
          }
          // otherwise continue
        }
      } catch (e) {}

      return undefined;
    }
    
    /** Decode JWT payload (does NOT verify signature) */
    private decodeJwtPayload(token: string): any | undefined {
      try {
        const parts = token.split('.');
        if (parts.length < 2) return undefined;
        const payload = parts[1];
        // base64url -> base64
        const base64 = payload.replace(/-/g, '+').replace(/_/g, '/');
        // decode
        const jsonPayload = decodeURIComponent(atob(base64).split('').map(function(c) {
          return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
        }).join(''));
        return JSON.parse(jsonPayload);
      } catch (e) {
        return undefined;
      }
    }

    /** Try to extract a numeric user id from a JWT token payload */
    private getUserIdFromToken(token: string): number | undefined {
      const p: any = this.decodeJwtPayload(token);
      if (!p) return undefined;
      // common fields
      if (p.sub !== undefined && p.sub !== null) return !isNaN(+p.sub) ? +p.sub : undefined;
      if (p.user_id !== undefined && p.user_id !== null) return !isNaN(+p.user_id) ? +p.user_id : undefined;
      if (p.id !== undefined && p.id !== null) return !isNaN(+p.id) ? +p.id : undefined;
      return undefined;
    }
  
    registerActivitys(data: any) {
      this.isLoadingSubject.next(true);
      let headers = new HttpHeaders({ 'Authorization': 'Bearer ' + this.authService.token });
      let URL = URL_SERVICIOS + '/activities';
      return this.http.post(URL, data, { headers: headers }).pipe(
        finalize(() => this.isLoadingSubject.next(false))
      );
    }
    
  listActivitys() {
    this.isLoadingSubject.next(true);
    const headers = new HttpHeaders({ 'Authorization': 'Bearer ' + this.authService.token });
    const URL = URL_SERVICIOS + '/activities';

    // Obtener id de sesión (numérico) cuando esté disponible
    const sid = this.getSessionId();
    let params = new HttpParams();
    if (sid !== undefined && sid !== null) {
      params = params.set('id', String(sid));
    }

    return this.http.get(URL, { headers, params }).pipe(
      finalize(() => this.isLoadingSubject.next(false))
    );
  }
  
  updateActivitys(activity_id: string, data: any) {
    this.isLoadingSubject.next(true);
    let headers = new HttpHeaders({'Authorization': 'Bearer ' + this.authService.token});
    let URL = URL_SERVICIOS + "/activities/" + activity_id;
    return this.http.put(URL, data, {headers: headers}).pipe(
      finalize(() => this.isLoadingSubject.next(false))
    );
  }
  
  deleteActivitys(activity_id: string) {
    this.isLoadingSubject.next(true);
    let headers = new HttpHeaders({'Authorization': 'Bearer ' + this.authService.token});
    let URL = URL_SERVICIOS + "/activities/" + activity_id;
    return this.http.delete(URL, {headers: headers}).pipe(
      finalize(() => this.isLoadingSubject.next(false))
    );
  }
}
