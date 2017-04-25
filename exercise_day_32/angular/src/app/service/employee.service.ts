import { Injectable } from '@angular/core';
import { Http, Response } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/map';

@Injectable()

export class EmployeeService{

  private apiUrl = "http://58f72d4bf7428912000c8bdf.mockapi.io/api/employees";

  constructor(private _http:Http){
  }

  GetList(): Observable<any[]>{
    // console.log(this._http.get(this.apiUrl).map((response: Response) => response.json()));
    return this._http.get('./data/employees.json')
            .map((response: Response) => response.json());
  }
}