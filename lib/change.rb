class Change

	attr_accessor :coin_type

	def initialize(coin_type)
		@coin_type = coin_type
	end

	def value
		coin_type.match(/\D+/).to_s == '£' ? coin_type.match(/\d+/).to_s.to_i * 100 : coin_type.match(/\d+/).to_s.to_i
	end

end