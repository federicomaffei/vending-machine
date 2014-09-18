class Change

	attr_accessor :coin_type, :value, :quantity

	def initialize(coin_type, quantity = 1)
		@coin_type = coin_type
		@quantity = quantity
	end

	def value
		coin_type.match(/\D+/).to_s == '£' ? pounds_convert : pence_convert
	end

	def pounds_convert
		coin_type.match(/\d+/).to_s.to_i * 100
	end

	def pence_convert
		coin_type.match(/\d+/).to_s.to_i
	end

end