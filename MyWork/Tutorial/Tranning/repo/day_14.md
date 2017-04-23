Daily report day 24/03/2017

I. Access Control in ruby

	Ruby gives you three levels of protection:

	1. public: can be called by everyone - no access control is enforced	
	
		Example: 

		class C  

	 	 def initialize  

 	  	 @n = 100  

	  	end  
  
	 	 def increase5 
 
		    @n *= 5  

		 end 
 
		end  
	  
		class D < C  
	
	 	 def show_n  

		    puts "n is #{@n}"  
	
		 end  

		end  
  
		d = D.new  

		d.increase5  

		d.show_n 
	
		Output: 500

	2. private: be called with an explicit receiver - the receiver is always self.

		Example:  

		 class C  

	 	  def initialize  

 	  	  @n = 100  

	  	 end  

		 def getIcrease5
		
			increase5 
			
		 end

		 def getIcrease5
		
			increase_5 
			
  		 end
  
		 private

	 	 def increase5 
 
		    @n *= 5  

		 end 
 
		end  
	  
		class D < C  
	
	 	 def show_n  

		    puts "n is #{@n}"  
	
		 end  

		end  
  
		d = D.new  
		
		d.getIncrease5 	#(return 500. Because only local class can use private method)

		d.increase5  	#(NoMethodError)

		d.show_n 
	
		Output: (NoMethodError)

	3.Protected: can be invoked only by objects of the defining class and its subclasses

		Example: 

		class C  

	 	 def initialize  

 	  	 @n = 100  

	  	end

		protected 
  
	 	 def increase5 
 
		    @n *= 5  

		 end 
 
		end  
	  
		class D < C  
	
	 	 def show_n  

		    puts "n is #{@n}"  
	
		 end  

		end  
  
		d = D.new  

		d.increase5  

		d.show_n 
	
		Output: 500



