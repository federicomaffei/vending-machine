require_relative 'product'
require_relative 'change'

class VendingMachine

	CAPACITY = 50
	PRODUCTS = [{name: 'Mars Bar', price: 100, code: "1", quantity: 10}, 
		{name: 'Snickers', price: 90, code: "2", quantity: 10},
		{name: 'Coca Cola', price: 80, code: "3", quantity: 10},
		{name: 'Pringles', price: 120, code: "4", quantity: 10},
		{name: 'Water', price: 60, code: "5", quantity: 10}]
	COINS = [{coin_type: '2£', quantity: 5}, {coin_type: '1£', quantity: 5},
		{coin_type: '50p', quantity: 5}, {coin_type: '20p', quantity: 5},
		{coin_type: '10p', quantity: 5}, {coin_type: '5p', quantity: 5},
		{coin_type: '2p', quantity: 5}, {coin_type: '1p', quantity: 5}]

	attr_accessor :capacity, :user_change, :selected_item

	def initialize(capacity = CAPACITY)
		@capacity = capacity
	end

	def items
		@items ||= []
	end

	def change
		@change ||= []
	end

	def user_change
		@user_change ||= 0
	end

	def empty?
		items.count == 0 ? true : false
	end

	def product_load
		PRODUCTS.each {|item| items << Product.new(item[:name], item[:price], item[:code], item[:quantity])}
	end

	def change_load
		COINS.each {|coin| change << Change.new(coin[:coin_type], coin[:quantity])}
	end

	def item_count(name)
		items.select {|item| item.name == name}.first.quantity
	end

	def change_count(coin_type)
		select_change(coin_type).quantity
	end

	def select_item(code)
		items.select {|item| item.code == code}.first
	end

	def select_change(coin_type)
		change.select {|item| item.coin_type == coin_type}.first
	end

	def accept_coins(coin_type)
		change << Change.new(coin_type)
		select_change(coin_type)
	end

	def sell_item(item)
		puts "You just bought a #{item.name}!"
		item.quantity -= 1
	end

	def check_equal_amount
		user_change == selected_item.price ? true : false
	end

	def check_superior_amount
		user_change > selected_item.price ? true : false
	end

	def check_inferior_amount
		user_change < selected_item.price ? true : false
	end

	def compute_due_change
		puts "Your change is #{user_change - selected_item.price}p."
	end

	def compute_missing_change
		puts "#{selected_item.price - user_change}p more needed!"
	end
end