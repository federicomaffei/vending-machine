require_relative 'product'
require_relative 'change'

module VendingMachine

	CAPACITY = 50
	PRODUCTS = [{name: 'Mars Bar', price: 100, code: "1", quantity: 10}, 
		{name: 'Snickers', price: 90, code: "2", quantity: 10},
		{name: 'Coca Cola', price: 80, code: "3", quantity: 10},
		{name: 'Pringles', price: 120, code: "4", quantity: 10},
		{name: 'Water', price: 60, code: "5", quantity: 10}]
	COINS = [{coin_type: "£2", quantity: 5}, {coin_type: "£1", quantity: 5},
		{coin_type: "50p", quantity: 5}, {coin_type: "20p", quantity: 5},
		{coin_type: "10p", quantity: 5}, {coin_type: "5p", quantity: 5},
		{coin_type: "2p", quantity: 5}, {coin_type: "1p", quantity: 5}]
	ALLOWED_PRODUCTS = ["1", "2", "3", "4", "5"]
	ALLOWED_COINS = ["£2", "£1", "50p", "20p", "10p", "5p", "2p", "1p"]

	attr_accessor :capacity, :user_change, :selected_product, :inserted_change

	def capacity
		@capacity = CAPACITY
	end

	def products
		@products ||= []
	end

	def change
		@change ||= []
	end

	def user_change
		@user_change ||= 0
	end

	def empty?
		products.count == 0 ? true : false
	end

	def products_load
		PRODUCTS.each {|product| products << Product.new(product[:name], product[:price], product[:code], product[:quantity])}
	end

	def change_load
		COINS.each {|coin| change << Change.new(coin[:coin_type], coin[:quantity])}
	end

	def product_count(name)
		products.select {|product| product.name == name}.first.quantity
	end

	def change_count(coin_type)
		select_change(coin_type).quantity
	end

	def select_product(code)
		raise InvalidCodeException.new if !ALLOWED_PRODUCTS.include?(code)
		@selected_product = products.select {|product| product.code == code}.first
	end

	def select_change(coin_type)
		raise InvalidCoinException.new if !ALLOWED_COINS.include?(coin_type)
		@inserted_change = change.select {|coin| coin.coin_type == coin_type}.first
	end

	def accept_coins(coin_type)
		select_change(coin_type).quantity += 1
		update_user_credit
	end

	def update_user_credit
		self.user_change = self.user_change + self.inserted_change.value
	end

	def sell_product(product)
		select_product(product.code).quantity -= 1
	end

	def check_equal_amount
		user_change == selected_product.price ? true : false
	end

	def check_superior_amount
		user_change > selected_product.price ? true : false
	end

	def check_inferior_amount
		user_change < selected_product.price ? true : false
	end

	def compute_due_change
		convert(user_change - selected_product.price)
	end

	def compute_missing_change
		convert(selected_product.price - user_change)
	end

	def compute_price
		convert(selected_product.price)
	end

	def convert(coin_value)
		coin_value < 100 ? "#{coin_value}p" : "£#{coin_value / 100.00}"
	end
end