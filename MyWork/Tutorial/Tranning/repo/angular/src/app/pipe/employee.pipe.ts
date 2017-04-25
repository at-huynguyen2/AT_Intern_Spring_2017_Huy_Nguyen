import { Pipe, PipeTransform } from '@angular/core';

@Pipe({name: 'employee'})
export class EmployeePipe implements PipeTransform {
  transform(inputData: string, valueDefaulf: any) {
    if (!inputData) {return valueDefaulf;}
    else {return inputData;}
  }
}