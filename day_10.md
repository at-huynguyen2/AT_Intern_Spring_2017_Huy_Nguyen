Daily report 20/03/17


I. Introduction: 

Block:defines methods where you can put number of statements and then you call that method. Similarly, Ruby has a concept of Block.

Proc: The same Block but proc is an instance of the Proc class. Proc’s usage is recall block code

Lambda: is function return Proc object, but it something is different with Proc

II. Different of block, proc, lambda 

	1. Procs are objects, blocks are not
	
		example:

			proc = Proc.new { puts "Hello World" }

			proc.call 
		Output: “Hello World”
		Because: Procs is Object so it have instand method call. But block 

		haven’t

	
	2. Lambdas check the number of arguments, while procs do not
	
		example: 

			p = Proc.new { |x| puts x +1 }

			p.call(1, 2)

			l = lambda { |x| puts x +1 }

			l.call(1, 2)
		 Output: 	2

			   	Argument Error


	
	3. Lambdas and procs treat the ‘return’ keyword differently

		example 1:
		
			def method_lambda

    			lam = lambda { return puts "Hello" }

      		lam.call

      		puts "all you"

			end

    			method_lambda
    			
		Output: Hello
			  all you

		example 2:

    			def method_proc

      		proc = Proc.new { return puts "Hello" }

      		proc.call

      		puts "all you"

    			end

    			method_proc
		Output: Hello



