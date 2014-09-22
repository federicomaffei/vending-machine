class Product

	attr_accessor :name, :price, :code, :quantity

	PRODUCTS_BATCH = [{name: 'Mars Bar', price: 100, code: "1", quantity: 10}, 
		{name: 'Snickers', price: 90, code: "2", quantity: 10},
		{name: 'Coca Cola', price: 80, code: "3", quantity: 10},
		{name: 'Pringles', price: 120, code: "4", quantity: 10},
		{name: 'Water', price: 60, code: "5", quantity: 10}
	]
	ALLOWED_PRODUCTS = ["1", "2", "3", "4", "5"]

	def initialize(name, price, code, quantity)
		@name = name
		@price = price
		@code = code
		@quantity = quantity
	end
end





