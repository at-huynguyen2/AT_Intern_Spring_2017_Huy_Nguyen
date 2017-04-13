#`Daily report Angular 11/4/2017`


###**`Component`**

####1. Briefly explain Event Binding in Angular?
Use when we want send data throught something event
*example:*
```javascript
	@Component({
	selector: 'my-app',
	template: `<input type="text" #name />
		<button (click)="onClick(name)" >Send data</button>
	`
	})
	export class AppComponent{
		onClick(value){
			console.log(value);
		}
	}
```
####2. Briefly explain Data Binding in Angular?
Data Binding help we auto synchronizes the data display in view and that holds the models.
When Model contain data then Model will binding to View (Property binding). After when View have change data then View will send event to Model and update data of Model.
####3. What are Event Emitters and how it works in Angular?
Event Emitter use talk child controller to parent controller.  Parent controller will listen event of child controller to update.

####4. Explain the life cycle hooks of Angular application?
A component has a lifecycle managed by Angular.

Angular creates it, renders it, creates and renders its children, checks it when its data-bound properties change, and destroys it before removing it from the DOM.

Angular offers lifecycle hooks that provide visibility into these key life moments and the ability to act when they occur.

A directive has the same set of lifecycle hooks, minus the hooks that are specific to component content and views. 




