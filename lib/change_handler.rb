require_relative 'product'
require_relative 'change'

module ChangeHandler

	def change
		@change ||= []
	end

	def valid_change(coin_type)
		raise InvalidCoinException.new if !Change::ALLOWED_COINS.include?(coin_type)
		change_selection(coin_type)
	end

	def change_selection(coin_type)
		change.select {|coin| coin.coin_type == coin_type}.first
	end		

	def change_load
		Change::COINS.each {|coin| change << Change.new(coin[:coin_type], coin[:quantity])}
	end

	def money_count(coin_type)
		valid_change(coin_type).quantity
	end

	def give_money(coin_type)
		valid_change(coin_type).quantity += 1
	end

	def take_money(coin_type)
		raise NoMoreCoinsException.new if money_count(coin_type) == 0
		valid_change(coin_type).quantity -= 1
	end

	def convert(coin_value)
		coin_value < 100 ? "#{coin_value}p" : "£#{coin_value / 100.00}"
	end

	def give_change(change_value)
		Change::ALLOWED_COINS.each do |coin|
			(change_value / change_selection(coin).value).times do
				give_money(coin)
				change_value -= change_selection(coin).value
			end
		end
	end
end