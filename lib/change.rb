class Change

	attr_accessor :coin_type, :value, :quantity

	COINS = [{coin_type: "£2", quantity: 1}, {coin_type: "£1", quantity: 1},
		{coin_type: "50p", quantity: 2}, {coin_type: "20p", quantity: 5},
		{coin_type: "10p", quantity: 5}, {coin_type: "5p", quantity: 5},
		{coin_type: "2p", quantity: 5}, {coin_type: "1p", quantity: 5}
	]
	ALLOWED_COINS = ["£2", "£1", "50p", "20p", "10p", "5p", "2p", "1p"]

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