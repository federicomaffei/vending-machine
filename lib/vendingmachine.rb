class VendingMachine

	def initialize
		@items = Array.new(50)
	end

	def items
		@items ||= []
	end

	def empty?
		items.count(nil) == items.length ? true : false
	end

	def initial_load
		10.times {@items << Product.new('Mars Bar', 100, 1)}
		10.times {@items << Product.new('Coca Cola', 70, 2)}
		10.times {@items << Product.new('Snickers', 90, 3)}
		10.times {@items << Product.new('Pringles', 120, 4)}
		10.times {@items << Product.new('Water', 50, 5)}	
	end

	def item_count(name)
		items.compact.select {|item| item.name == name}.count
	end
end