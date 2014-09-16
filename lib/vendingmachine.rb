class VendingMachine

	def initialize
		@items = Array.new(100)
	end

	def items
		@items ||= []
	end

	def empty?
		items.count(nil) == items.length ? true : false
	end
end