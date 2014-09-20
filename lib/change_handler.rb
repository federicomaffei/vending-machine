require_relative 'product'
require_relative 'change'

module ChangeHandler
	
	attr_accessor :user_change, :inserted_change

	def change
		@change ||= []
	end

	def user_change
		@user_change ||= 0
	end

	def change_load
		Change::COINS.each {|coin| change << Change.new(coin[:coin_type], coin[:quantity])}
	end

	def change_count(coin_type)
		select_change(coin_type).quantity
	end

	def change_update(coin_type)
		select_change(coin_type).quantity += 1
	end

	def select_change(coin_type)
		raise InvalidCoinException.new if !Change::ALLOWED_COINS.include?(coin_type)
		change.select {|coin| coin.coin_type == coin_type}.first
	end

	def accept_coins(coin_type)
		@inserted_change = select_change(coin_type)
		change_update(coin_type)
		update_user_credit
	end

	def update_user_credit
		self.user_change = self.user_change + self.inserted_change.value
	end

	def convert(coin_value)
		coin_value < 100 ? "#{coin_value}p" : "£#{coin_value / 100.00}"
	end
end