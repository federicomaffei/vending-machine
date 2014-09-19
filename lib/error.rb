class InvalidCodeException < Exception

	def initialize(msg = "The entered code does not correspond to a product.")
		super
	end
end

class InvalidCoinException < Exception
	
	def initialize(msg = "The entered coin is not valid.")
		super
	end
end