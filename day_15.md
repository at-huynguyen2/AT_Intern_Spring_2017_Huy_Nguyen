
Daily report 27/03/2016


1. What are the differences between a variable that is: `null`, `undefined`?
	
	*undefined is where no notion of the thing exists; it has no type, and it's never been referenced before in that scope

	*null is where the thing is known to exist, but it's not known what the value is.

2. What is `use strict`? what are the advantages and disadvantages to using it?

	Use strict is mode that developer must declare variable before use.
	
	Advantage: 
		
		*	It prevents, or throws errors
		
		*	Clear code. Help code mixed strict and “normal” modes

	Disadvantages:
		
	 	* Developer don’t like the constraint and want to use all the 			features of the language.

3. How do you understand DOM tree?

	DOM (Document Object Model)
	
		HTML tag has properties and has a parent-child hierarchy with other HTML tags. The hierarchy and attributes of this HTML tag are called selectors, and in the DOM it is responsible for handling issues such as changing the tag's attributes, changing the tag's HTML structure, and so on.

		
		                                 

















4. What are the differences between `==` and `===`? Write an example for each case (if any)?

	We use ‘==’ when 	equal value of 2 variable


	We use ‘===’ when equal value and type of 2 variable

	example: 
		var a = 4
	
		var b = “4”

		var c = 4

		a == b 	// return true

		a === b 	// return false
	
		a === c 	// return true

5. Explain the differences on the usage of foo between `function foo() {}` and `var foo = function() {}`

	function foo() {} :  is an actual named function

	var foo = function() {}  is a regular variable declaration with an 	anonymous function attached to it

6. How can JavaScript manipulate HTML dynamically?

	We will use DOM, BOM and javascript to associate us when want use manipulate HTML dynamically

	what ís DOM? DOM (Document Object Model) 	In HTML, the element is an object 	in the Document, displayed as the HTML DOM, the style it calls DOM CSS, 	and so on.

	what ís BOM? Browser objects, such as the address bar, store passwords 	(cookies). BOM provides the standard that all browsers usually must have 

	=>Javascript helps us to connect between DOM and BOM, and manipulate them

7.How to store a Javascript variable at client side?

	We can use BOM to store a javascript variable ar client side as cookie, session, vv..

	example: 

		//set value

 		localStorage.setItem('todoData', this.innerHTML);

		//read value

		if ( localStorage.getItem('todoData') ) {
		
		    edit.innerHTML = localStorage.getItem('todoData'); 
 		}





 
