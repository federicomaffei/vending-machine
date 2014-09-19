require_relative 'vendingmachine'

class Application

	attr_accessor :machine

	def initialize
		@machine = VendingMachine.new
	end

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
		puts "#{machine.compute_missing_change}p more needed!"
	end

	def return_change
		confirm_purchase
		puts "Your change is #{machine.compute_due_change}p."
	end		

	def get_product_choice
		begin
			machine.select_item(STDIN.gets.chomp)
			puts "You selected a #{machine.selected_item.name}. The price is #{machine.selected_item.price}."
		rescue InvalidCodeException
			puts "The entered code does not correspond to a product."
		end
	end

	def get_payment
		begin
			machine.accept_coins(STDIN.gets.chomp)
			puts "You inserted #{machine.inserted_change.coin_type}."
		rescue InvalidCoinException
			puts "The entered coin is not valid."
		end
	end

	def confirm_purchase
		puts "You just bought a #{machine.selected_item.name}!"
	end

	def check_payment
		machine.check_equal_amount ? confirm_purchase : check_inequal_payment
	end

	def check_inequal_payment
		machine.check_superior_amount ? return_change : ask_for_more_change
	end
end