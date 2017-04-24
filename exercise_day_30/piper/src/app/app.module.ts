import { NgModule, Pipe }      from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';

import { AppComponent }  from './app.component';
import { EmployeeComponent } from './employee.component';
import { EmployeePipe } from './pipe/employee.pipe';
import { CapitalizePipe } from "./pipe/capitalize.pipe";
import { SearchPipe } from './pipe/search.pipe';

@NgModule({
  imports:      [ BrowserModule, FormsModule, HttpModule, NgbModule.forRoot()],
  declarations: [
    AppComponent,
    CapitalizePipe,
    SearchPipe,
    EmployeeComponent
  ],
  bootstrap:    [ AppComponent ]
})
export class AppModule {


}