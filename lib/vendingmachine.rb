require_relative 'product'

class VendingMachine

	def initialize
		@items = Array.new(50)
	end

	def items
		@items ||= []
	end

	def empty?
		@items.count(nil) == items.length ? true : false
	end

	def initial_product_load
		@items[0..9] = Array.new(10) {Product.new('Mars Bar', 100, 1)}
		@items[10..19] = Array.new(10) {Product.new('Snickers', 90, 2)}
		@items[20..29] = Array.new(10) {Product.new('Coca Cola', 80, 3)}
		@items[30..39] = Array.new(10) {Product.new('Pringles', 120, 4)}
		@items[40..49] = Array.new(10) {Product.new('Water', 60, 5)}
	end

	def item_count(name)
		@items.compact.select {|item| item.name == name}.count
	end
end