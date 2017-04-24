import { Component, OnInit } from '@angular/core';
import { EmployeeService } from './service/employee.service';

import { Http } from '@angular/http';
import 'rxjs/add/operator/map';
//import 'rxjs/add/operator/fiter';

@Component({
  selector: 'employee-list',
  templateUrl: './template/filter.employee.component.html',
  providers: [EmployeeService],
})

export class EmployeeComponent{
  public employees : any[];

  constructor(private employeeService : EmployeeService, private _http : Http ){
    this.employees = [];
  }
  ngOnInit(){
    this.employeeService.GetList().subscribe((response:any)=>{
      this.employees = response["employees"];
    });
  }
}

