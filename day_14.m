Daily report day 24/03/2017

I. Access Control in ruby

	Ruby gives you three levels of protection:

	1. public: can be called by everyone - no access control is enforced

	2. private: be called with an explicit receiver - the receiver is always self.

	3. Protected: can be invoked only by objects of the defining class and its subclasses
	
	Example: 

	class Aminal

		def initificate prameter

			puts “#{prameter}”

		end
		
		def methodAction
			
			puts “run away”

		end
		
		def methodSleep

			puts “Sleep at afternoon”

		def methodEmotion

			puts “Scare when meet predator big more than”

		end

		public :methodEmotion		
		
		private :methodSleep

		protected :methodAction
	
	end

	class Horse < Aminal

		
	end
