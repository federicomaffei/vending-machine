require_relative 'change_handler'
require_relative 'product_handler'
require_relative 'error'

class VendingMachine

	include ChangeHandler, ProductHandler

	def welcome_message
		puts "Welcome to Federico's Vending Machine!"
	end

	def prompt_product
		puts "Please, enter 1 for Mars Bar, 2 for Snickers, 3 for Coca Cola, 4 for Pringles, 5 for Water:"
	end

	def prompt_change
		puts "Please enter a coin, accepted formats: £2, £1, 50p, 20p, 10p, 5p, 2p, 1p."
	end

	def ask_for_more_change
		puts("#{compute_missing_change} more needed!")
		prompt_change
	end

	def return_change
		puts("Your change is #{compute_due_change}.")
		confirm_purchase
	end		

	def get_product_choice
		begin
			select_product(STDIN.gets.chomp)
			puts "You selected a #{selected_product.name}. The price is #{compute_price}."
		rescue InvalidCodeException
			puts "The entered code does not correspond to a product."
		end
	end

	def get_payment
		begin
			accept_coins(STDIN.gets.chomp)
			puts "You inserted #{inserted_change.coin_type}."
		rescue InvalidCoinException
			puts "The entered coin is not valid."
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
		else ask_for_more_change
		end
	end

	def check_equal_amount
		user_change == selected_product.price ? true : false
	end

	def check_superior_amount
		user_change > selected_product.price ? true : false
	end

	def check_inferior_amount
		user_change < selected_product.price ? true : false
	end

	def compute_due_change
		convert(user_change - selected_product.price)
	end

	def compute_missing_change
		convert(selected_product.price - user_change)
	end

	def compute_price
		convert(selected_product.price)
	end
end