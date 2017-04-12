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

####4. Explain the life cycle hooks of Angular application?


###**`Extra`**
###Briefly explain ElementRef in Angular? Write an example.

