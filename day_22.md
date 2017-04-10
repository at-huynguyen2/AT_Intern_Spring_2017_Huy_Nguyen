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




