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

class NoMoreCoinsException < Exception
	def initialize(msg = "There are no more coins of this kind.")
		super
	end
end