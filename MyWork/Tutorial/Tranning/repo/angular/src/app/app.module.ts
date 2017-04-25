import { NgModule, Pipe }      from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { ReactiveFormsModule } from '@angular/forms';

import { AppComponent }  from './app.component';
// import { EmployeeComponent } from './employee.component';
import { FormComponent } from './form.component';
import { EmployeePipe } from './pipe/employee.pipe';
import { CapitalizePipe } from "./pipe/capitalize.pipe";
import { SearchPipe } from './pipe/search.pipe';


@NgModule({
  imports:      [ BrowserModule, FormsModule, HttpModule, ReactiveFormsModule, NgbModule.forRoot()],
  declarations: [
    AppComponent,
    CapitalizePipe,
    SearchPipe,
    FormComponent
  ],
  bootstrap:    [ AppComponent ]
})
export class AppModule {


}