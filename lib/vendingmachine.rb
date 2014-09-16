require_relative 'product'
require_relative 'change'

class VendingMachine

	CAPACITY = 50

	attr_accessor :capacity

	def initialize(capacity = CAPACITY)
		@capacity = capacity
	end

	def items
		@items ||= []
	end

	def change
		@change ||= []
	end

	def empty?
		items.count(nil) == items.length ? true : false
	end

	def initial_product_load
		10.times {items << Product.new('Mars Bar', 100, 1)}
		10.times {items << Product.new('Snickers', 90, 2)}
		10.times {items << Product.new('Coca Cola', 80, 3)}
		10.times {items << Product.new('Pringles', 120, 4)}
		10.times {items << Product.new('Water', 60, 5)}
	end

	def initial_change_load
		5.times {change << Change.new('2£')}
		5.times {change << Change.new('1£')}
		5.times {change << Change.new('50p')}
		5.times {change << Change.new('20p')}
		5.times {change << Change.new('10p')}
		5.times {change << Change.new('5p')}
		5.times {change << Change.new('2p')}
		5.times {change << Change.new('1p')}
	end

	def item_count(name)
		items.compact.select {|item| item.name == name}.count
	end

	def change_count(coin_type)
		change.select {|item| item.coin_type == coin_type}.count
	end
end