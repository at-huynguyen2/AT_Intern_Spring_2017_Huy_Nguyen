#`Daily report Angular 1/4/2017`


# Angular 2

### Knowledge round-up

- **Component**
	- What is @Component decorator in Angular 2? 

	@Component decorator use to mark a class as an Angular component and collects component configuration metadata. 

```javascript
 @Component({
	 selector: 'my-app', 
	 template: `Xin chao {{name}}!`
})
  class MyApp {
    name: string = 'Huy';
  }
```
	- What does @Component decorator do?

	When selector <my-app> be call then angular will binding data form class MyApp to template and show all to view. And Component be design to use again multi times.
	

- **Directive**

  - What is @Directive decorator in Angular 2? What does @Directive decorator do?
	
	Directive decorator allows you to mark a class as an Angular directive and provide additional metadata.

	A Directive modifies the DOM to change apperance, behavior or layout of DOM elements and directive must belong to an NgModule .

```javascript
@Component({
  selector: 'my-app',
  template: `
    <button type="button" (click)="clickButton()">Click me</button>
    <hr>
    <div *ngIf="isCheck">
      Xin chao the gioi!
    </div>
  `
})
export class AppComponent {
  isCheck = true;

  clickButton() {
    this.isCheck = !this.isCheck;
  }
}
```
		
- **Summary**
  - Explain @Input decorator in Angular 2?

which is done via “input” binding to pass data pass data into components to dynamically configure them (typically parent to child).

*example:*
```html
<my-app [user]="currentUser"></my-app>
```
we add an @Input binding to user
```javascript
import { Component, Input } from '@angular/core';

@Component({
  selector: 'my-app',
  template: '<div>{{user.name}}</div>'
})
export class UserProfile {
  @Input() user;
  constructor() {}
}

```

  - Explain @Output decorator in Angular 2?

When we want to bind to particular event, you can use @Output.

We can bind the event that user-profile emits

```html
<my-app (userUpdated)="handleUserUpdated($event)"></my-app>
```
To create a custom event, we can use the new @Output decorator
```javascript
import { Component, Output, EventEmitter } from '@angular/core';

@Component({
  selector: 'my-app',
  template: '<div>My name is {{user.name}}</div>'
})
export class UserProfile {
  @Output() userEdited = new EventEmitter();

  constructor() {
    // Update user
    // ...
    this.userEdited.emit(this.user);
  }
}

```
  - What is difference between component and directive in Angular 2?

Component : 
```javascript

import {Component, View} from '@angular/core';
ame
@Component({
  selector: 'message'
})
@View({
  template: `
      <h1>Xin chao {{name}}</h1>
  `
})
class Message {
  constructor(public name: string) {}
}

<message></message>
```
Directive:
```javascript
import {Directive} from 'angular2/angular2';
@Directive({
    selector: "[my-directive]",
    hostListeners: {
        'click': 'showAlert()'
    }
})
class Message {
    constructor() {}
    showAlert() { Alert('This is directive'); }
}d
<button my-directive>Click here</button>
```
Diffrent between:
| Component | Directive |
|-----------|-----------|
| Component is a directive which use shadow DOM to create encapsulate visual behavior called components.  Components are typically used to create UI widgets. | Directives is used to add behavior to an existing DOM element.  |
| Component is used to break up the application into smaller components. | Directive is use to design re-usable components |
| Only one and one component can be present per DOM element. | Can have Many directive can be used in a per DOM element. |
| Use view | Don't have view |




  - Write an example for Two-way data binding in Angular 2?

```javascript
import {Component} from '@angular/core';
@Component({
  selector: 'my-tutorial',
  template: `
    <button (click) = "OnClick(name)">Click me</button>
    <input type="text" #name />
    <p><strong>Two way binding</strong></p>
    <input type="text" [(ngModel)] = "fname" />
    <input type="text" [(ngModel)] = "lname" />
    Full name : {{fname}} {{lname}}
    `
})
```

