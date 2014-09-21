require_relative './lib/vendingmachine'

machine = VendingMachine.new
machine.products_load
machine.change_load
machine.welcome_message
machine.prompt_product
machine.get_product_choice
machine.prompt_money
loop do
	machine.get_payment
	if machine.check_payment == true
		exit
	end
end
