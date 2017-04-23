Daily report day 11



**CSS**

  - How to properly make initial styles render correctly across browsers / platforms?

	You must declare tag in <header>


	<meta name=”viewport” content=”width=device-width, initinal-scale=1.0/>


	Afer you can set style in css file for multi different size screen



  - What is the "box model" in CSS? Which CSS properties are a part of it?


	The CSS box model is essentially a box that wraps around every HTML 	element


	In css, Properties consists of: margins, borders, padding, and the actual 	content.


  - What is better way to clear `float`?

	
	There are use <div style=”clear:both”></div>
	


  - The CSS `media` query syntax.
	
	@media not|only mediatype and (media feature) {


    		CSS-Code;


	}


  - What is `font-face`?

	
	`font-face` is the typeface that will be applied by a web browser to some 	text

	
	example:


		.text { font-family: "calibri", Garamond, 'Comic Sans MS'; }

**SASS**


  - How does "CSS Pre-processor" work?


	You must intall gem sass. Use follow command: 


	sass –watch name_file_scss.scss:name_file_css.css


  - What are the advantages when working with Sass?


	1. Performer for code css 


	2. Device main css file become multy part, multi file. So, it can use we well manager css


	3. Easy to update, improve because sass alow we declare vairiable for properly

	
	4. You can reuse code css that the same because sass use mixin	



















