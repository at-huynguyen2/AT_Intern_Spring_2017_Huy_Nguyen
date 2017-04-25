import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
   name: 'search'
})

export class SearchPipe implements PipeTransform {
   transform(value: any, args:string=''): any {
     console.log(value);
     if(!value) return value;
     else {
        if(value.toLowerCase().indexOf(args.toLowerCase())!= -1) {
           return value;
        }
     }
   }
}