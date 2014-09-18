class Application

	def welcome_message
		puts "Welcome to Federico's Vending Machine!"
	end

	def prompt_product
		puts "Please, enter 1 for Mars Bar, 2 for Snickers, 3 for Coca Cola, 4 for Pringles, 5 for Water:"
	end


	def prompt_change
		puts "Please enter a coin, accepted formats: 2£, 1£, 50p, 20p, 10p, 5p, 2p, 1p."
	end
end