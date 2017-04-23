RUBY

I. Array

	The same other language but array in ruby can containt multi type other data structure in one array

	In ruby support multi function is useful, exmaple as:
 
	1. map usage to pass each element in array

		expample: 

		arr = [1, 2, 3]

		put arr.map {|i| i*2}

		put a

		output: [2,  4,  6] [1, 2, 3]

               !map

		example:

		arr = [1, 2, 3]

		put arr .map! {|i| i*2}

		put a

		output: [2,  4,  6] [2, 4, 6]
		
	collet , map, select, detect

	2. select usage to choose element in array, we can create new 	array choose from old array
	
		example:
		
		arr = [1, 2, 3, 4, 5]

		newArr =  arr.select {|i| i>3}

		put  newArr

		output: {4, 5}

	3. detect usage contracdict with select. Select perform 		block code when condition is true but 	detect perform 		block code when condition is false

		example:
		
		arr = [1, 2, 3, 4, 5]

		newArr =  arr.select {|i| i>3}

		put  newArr

		output: {1, 2 ,3}

	4. inject : When you think of accumulating, 		concatenating, or totaling values in an array, then think of 	inject

		example:

		a = [1,2,3,4]

		sum = a.inject {|acc,n| acc + n}

		put sum 

		ouput: 10

	5. etc…

I. Hash: Also same save array with key and value. Each value will reference to only key. Hash advance more Array because hash effect sort element so handle in array quickly.

	Note:
 	
		* Create key string
			
			example: 

			months = Hash.new( "month" )

			months = {"1" => "January", "2" => "February"}
		* Create symbol string

			example:

			months = Hash.new( "month" )

			months = {1: “January”, 2: "February"}
	The reason is efficiency, with multiple gains over a String:

1. Symbols are immutable, so the question "what happens if the key changes?" doesn't need to be asked. 

2. Strings are duplicated in your code and will typically take more space in memory. 

3. Hash lookups must compute the hash of the keys to compare them. This is O(n) for Strings and constant for Symbols. 













	



	

