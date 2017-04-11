#`Daily report SQL 7/4/2017`


#### 1. What is TypeScript and Why do we need it?
TypeScript is a strict superset of JavaScript, and adds optional static typing and class-based object-oriented programming to the language
TypeScript is complier to ESC6 javascript to ESC5 to all current brower  can understand and run.
TypeScripts help we clear code, use object-oriented for medium and big project
####2. How can you get TypeScript and install it?
For the latest stable version:
*  Install TypeScript: Open terminal and insert command follow: 
		npm install -g typescript
* Get TypeScript: 
		git clone https://github.com/Microsoft/TypeScript.git
		cd typescript
		npm install -g gulp
		npm instal
####3. How do you compile TypeScript files?
	example: Comand to build myscript.ts to myscript.js
	tsc --watch myscript.ts myscript.js
####4. Which Object Oriented terms are supported by TypeScript? Write an example.
* Encapsulation
* Inheritance
* Abstraction
example: 
```javascript

export module Car
{
    export interface Honda { number_wheel(amount: number); }

    export class BankAccount implements Fee {
        ChargeFee(amount: number) { }
    }
}

```
* Polymorphism

####5. How do you implement inheritance in TypeScript? Write an example.
Inheritance in TypeScript we use keyword "extends" and super function
Example: 
```javascript
class Shape
{
	constructor(public width: number = 0, public height: number = 0,public name: string){}

	area(){
	    var area = (this.width * this.height);
	    document.write(`Area of ${this.name}: ${area} `);
	  }

	circuit(){
	   var circuit = ((this.width + this.height) * 2);
	   document.write(`Circuit of ${this.name}: ${circuit} <br>`);
	  }
	}

	class Rectangle extends Shape{
	  constructor(public width: number, public height: number,public name: string){
	    super(width, height,name);
	  }
	}
var shap = new Square(6,"Square");
shap.area();
shap.circuit();
```
###Example for future ES6
####1. Block scope variable
Variable will have limit action in block declared it
```javascript
function(email){
  var pattern = /\S+@\S+\.\S+/;
  var isValidateEmail = pattern.test(email); 
  if(isValidateEmail == true){
	  console.log("Email vailidate");
	  //correct
  }
};

if(isValidateEmail == false){
	  console.log("Email don't vailidate");
	  //error
  }
```
####2. Template Literals
*Syntax of ES5:  *
```javascript
var a = 5;
var b = 10;
console.log('Sum a and b is ' + (a + b));
//return 15
```
*Syntax of ES6:  *
```javascript
var a = 5;
var b = 10;
console.log('Sum a and b is ' + ${a + b});
//return 15
```
####3. Multi-line strings
*Syntax of ES5:  *
```javascript
var st = "This string will \
  \n down line";
```
*Syntax of ES6:  *
```javascript
var st = `This string will 
	down line`;
```
####4. Arrow functions
```javascript
var grade_student = [
  'Maria',
  'Jon',
  'Harry',
  'Kery'
];

var length = grade_student.map(function(grade_student) { 
  return grade_student.length; 
});
//5,3,5,4 
```
####5. For...of
*Syntax of ES5:  *
```javascript
for (var item = 0, lenght = arr.length; item < len; item++) {
    $str += "<p>" + arr[item] + "</p>";
  }
```
*Syntax of ES6:  *
```javascript
for (var item = 0, lenght = arr.length; item < len; item++) {
    $str += "<p> ${arr[item]} </p>";
  } 
```
####6. Default parameters
Default function parameters allow formal parameters to be initialized with default values if no value or undefined is passed.
```javascript
function sum(a, b) {
  b = (typeof b !== 'undefined') ?  b : 0;
  return a + b;
}

sum(5, 2); 	// return 7
multiply(5);    // return 5
```




