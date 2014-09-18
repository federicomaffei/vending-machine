require_relative 'vendingmachine'

class Application

	attr_accessor :machine, :selected_product

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
		puts "Please enter a coin, accepted formats: 2£, 1£, 50p, 20p, 10p, 5p, 2p, 1p."
	end

	def get_product_choice
		selected_product = machine.select_item(STDIN.gets.chomp)
		puts "You selected a #{selected_product.name}. The price is #{selected_product.price}."
	end

	def get_payment
		puts "You inserted #{machine.accept_coins(STDIN.gets.chomp).coin_type}."
	end

end