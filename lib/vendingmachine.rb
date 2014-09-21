require_relative 'change_handler'
require_relative 'product_handler'
require_relative 'user'
require_relative 'error'

class VendingMachine

	include ChangeHandler, ProductHandler

	attr_accessor :user

	def initialize
		@user = User.new
		change_load
		products_load
	end

	def inserted_money
		@inserted_money
	end

	def selected_product
		@selected_product
	end

	def welcome_message
		puts "Welcome to Federico's Vending Machine!"
	end

	def prompt_product
		puts "Please, enter 1 for Mars Bar, 2 for Snickers, 3 for Coca Cola, 4 for Pringles, 5 for Water:"
	end

	def prompt_money
		puts "Please enter a coin, accepted formats: £2, £1, 50p, 20p, 10p, 5p, 2p, 1p."
	end

	def ask_for_more_money
		puts("#{compute_missing_change} more needed!")
		prompt_money
	end

	def return_change
		puts("Your change is #{compute_due_change}.")
		confirm_purchase
	end		

	def get_product_choice
		begin
			@selected_product = valid_product(STDIN.gets.chomp)
			puts "You selected a #{selected_product.name}. The price is #{compute_price}."
		rescue InvalidCodeException
			puts "The entered code does not correspond to a product."
		end
	end

	def get_payment
		begin
			accept_coins(STDIN.gets.chomp)
			puts "You inserted #{inserted_money.coin_type}."
		rescue InvalidCoinException
			puts "The entered coin is not valid."
		rescue NoMoreCoinsException
			puts "You do not have more coins of this kind."
		end
	end

	def confirm_purchase
		puts "You just bought a #{selected_product.name}!"
	end

	def check_payment
		if check_equal_amount
			confirm_purchase
			return true
		else check_inequal_payment
		end
	end

	def check_inequal_payment
		if check_superior_amount
			return_change
			return true
		else ask_for_more_money
		end
	end

	def check_equal_amount
		user.credit == selected_product.price ? true : false
	end

	def check_superior_amount
		user.credit > selected_product.price ? true : false
	end

	def check_inferior_amount
		user.credit < selected_product.price ? true : false
	end

	def compute_due_change
		convert(user.credit - selected_product.price)
	end

	def compute_missing_change
		convert(selected_product.price - user.credit)
	end

	def compute_price
		convert(selected_product.price)
	end

	def accept_coins(coin_type)
		@inserted_money = valid_change(coin_type)
		self.give_money(coin_type)
		user.take_money(coin_type)
		update_user_credit
	end

	def update_user_credit
		user.credit = user.credit + inserted_money.value
	end
end