import { NgModule, APP_INITIALIZER } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { HttpClientModule } from '@angular/common/http';
import { HttpClientInMemoryWebApiModule } from 'angular-in-memory-web-api';
import { ClipboardModule } from 'ngx-clipboard';
import { TranslateModule } from '@ngx-translate/core';
import { InlineSVGModule } from 'ng-inline-svg-2';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { AuthService } from './modules/auth/services/auth.service';
import { environment } from 'src/environments/environment';
import { SweetAlert2Module } from '@sweetalert2/ngx-sweetalert2';
import { ToastrModule } from 'ngx-toastr';
// #fake-start#
import { FakeAPIService } from './_fake/fake-api.service';
import { PermissionsModalComponent } from './shared/components/permissions-modal/permissions-modal.component';
import { ClientsComponent } from './modules/clients/clients.component';
import { CreateClientsPersonComponent } from './modules/clients/create-clients-person/create-clients-person.component';
import { EditClientsPersonComponent } from './modules/clients/edit-clients-person/edit-clients-person.component';
import { DeleteClientsComponent } from './modules/clients/delete-clients/delete-clients.component';
import { ListsClientsComponent } from './modules/clients/lists-clients/lists-clients.component';
import { CreateClientsCompanyComponent } from './modules/clients/create-clients-company/create-clients-company.component';
import { EditClientsCompanyComponent } from './modules/clients/edit-clients-company/edit-clients-company.component';

// #fake-end#

function appInitializer(authService: AuthService) {
  return () => {
    return new Promise((resolve) => {
      //@ts-ignore
      authService.getUserByToken().subscribe().add(resolve);
    });
  };
}

@NgModule({
  declarations: [AppComponent, PermissionsModalComponent],
  imports: [
    BrowserModule,
    BrowserAnimationsModule,
    TranslateModule.forRoot(),
    HttpClientModule,
    ClipboardModule,
    // #fake-start#
    environment.isMockEnabled
      ? HttpClientInMemoryWebApiModule.forRoot(FakeAPIService, {
        passThruUnknownUrl: true,
        dataEncapsulation: false,
      })
      : [],
    // #fake-end#
    AppRoutingModule,
    InlineSVGModule.forRoot(),
    NgbModule,
    SweetAlert2Module.forRoot(),
    ToastrModule.forRoot(),
  ],
  providers: [
    {
      provide: APP_INITIALIZER,
      useFactory: appInitializer,
      multi: true,
      deps: [AuthService],
    },
  ],
  bootstrap: [AppComponent],
})
export class AppModule { }
