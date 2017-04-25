import { Component, OnInit } from "@angular/core"
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';


@Component({
  selector: 'my-form',
  templateUrl: './template/form.component.html'
})

export class FormComponent{

  listMember : any[];
  team_name:string;
  member: any;

  memberForm: FormGroup;
  firstName: FormControl;
  lastName: FormControl;
  value : any;

  selectMember(index:number){
    this.member = this.listMember[index];
  }

  constructor (builder: FormBuilder) {

    this.member = {
      info: {
          first_name: '',
          last_name: '',
          birthday: ''
        },
      account: {
        email: '',
        github: ''
      }
    };
    this.listMember = [
      {
        info: {
          first_name: 'hi',
          last_name: 'hii',
          birthday: '2/2/2017'
        },
        account: {
          email: '',
          github: 'github/abc.com'
        }
      },{
        info: {
          first_name: 'anh',
          last_name: 'hhi',
          birthday: '2/2/2017'
        },
        account: {
          email: '',
          github: 'github/anh.com'
        }
      },{
        info: {
          first_name: 'de',
          last_name: 'hi',
          birthday: '2/2/2017'
        },
        account: {
          email: '',
          github: 'github/de.com'
        }
      },
    ];

    this.firstName = new FormControl('', [
        Validators.required,
        Validators.minLength(6)
      ]
    );
    this.lastName = new FormControl('', [Validators.required]);
    this.email = new FormControl('', []);
    this.memberForm = builder.group({
        firstName: this.firstName,
        lastName: this.lastName
      }
    );
    this.firstName.valueChanges.subscribe(
      data => {
        this.formatEmail();
      }
    );
    this.lastName.valueChanges.subscribe(
      data => {
        this.formatEmail();
      }
    );
  }

  formatEmail(){
     var email= this.firstName.value + '.' + this.lastName.value + '@asiantech.vn';
     this.member.account.email = email;
  }

}