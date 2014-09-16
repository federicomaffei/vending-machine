class Product

	attr_accessor :name, :price, :code, :sell

	def initialize(name, price, quantity, code)
		@name = name
		@price = price
		@code = code
		@sold = false
	end

	def sold?
		@sold
	end

	def sell
		@sold = true
	end

	def stock
		@sold = false
	end
end