import { Component, OnInit } from '@angular/core';
import { EmployeeService } from './service/employee.service';

import { Http } from '@angular/http';
import 'rxjs/add/operator/map';
//import 'rxjs/add/operator/fiter';

@Component({
  selector: 'employee-list',
  // templateUrl: './template/filter.employee.component.html',
  templateUrl : './template/add.employee.component.html',
  providers: [EmployeeService],
})

export class EmployeeComponent{
  public employees : any[];

  constructor(private employeeService : EmployeeService, private _http : Http ){
    this.employees = [];
  }
  ngOnInit(){
    // this.employeeService.GetList().subscribe((response:any)=>{
    //   this.employees = response["employees"];
    // });
    this.employees = [];
  }
  addEmployee(model: any){
    // var a = {name : model.value.name};
    // this.employees.push(a);
    // console.log(model.value.info);
    var a = { info: model.value.info, account: model.value.account}
    this.employees.push(a);
    console.log(this.employees);
  }
}

