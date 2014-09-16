class Change

	attr_accessor :name, :quantity

	def initialize(name, quantity)
		@name = name
		@quantity = quantity
	end

	def value
		name.match(/\D+/).to_s == '£' ? name.match(/\d+/).to_s.to_i * 100 : name.match(/\d+/).to_s.to_i
	end

end