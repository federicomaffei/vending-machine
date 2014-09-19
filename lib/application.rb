require_relative 'vendingmachine'

class Application

	include VendingMachine

	attr_accessor :machine

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
		puts "#{compute_missing_change}p more needed!"
	end

	def return_change
		confirm_purchase
		puts "Your change is #{compute_due_change}p."
	end		

	def get_product_choice
		begin
			select_product(STDIN.gets.chomp)
			puts "You selected a #{selected_product.name}. The price is #{selected_product.price}."
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
		check_equal_amount ? confirm_purchase : check_inequal_payment
	end

	def check_inequal_payment
		check_superior_amount ? return_change : ask_for_more_change
	end

	def application_logic
		puts 'test'
	end
end