require 'vendingmachine'

describe VendingMachine do
	let(:machine) {VendingMachine.new}
	context 'user interface' do
		it 'welcomes the user' do
			expect(STDOUT).to receive(:puts).with "Welcome to Federico's Vending Machine!"
			machine.welcome_message
		end

		it 'prompts the user to choose a product' do
			expect(STDOUT).to receive(:puts).with "Please, enter 1 for Mars Bar, 2 for Snickers, 3 for Coca Cola, 4 for Pringles, 5 for Water:"
			machine.prompt_product
		end

		it 'prompts the user to input change' do
			expect(STDOUT).to receive(:puts).with "Please enter a coin, accepted formats: £2, £1, 50p, 20p, 10p, 5p, 2p, 1p."
			machine.prompt_money
		end
	end

	context 'handling user choices' do
		it 'allows the user to select a product by code' do
			expect(STDIN).to receive(:gets).and_return "1"
			expect(STDOUT).to receive(:puts).with "You selected a Mars Bar. The price is £1.0."
			machine.get_product_choice
		end

		it 'handles an invalid product choice' do
			expect(STDIN).to receive(:gets).and_return "wrong"
			expect(STDOUT).to receive(:puts).with "The entered code does not correspond to a product."
			machine.get_product_choice
		end

		it 'allows the user to put money in the machine.' do
			expect(STDIN).to receive(:gets).and_return "£2"
			expect(STDOUT).to receive(:puts).with "You inserted £2."
			machine.get_payment
		end

		it 'handles an invalid coin input.' do
			expect(STDIN).to receive(:gets).and_return "wrong"
			expect(STDOUT).to receive(:puts).with "The entered coin is not valid."
			machine.get_payment
		end
	end

	context 'handling payment logic' do
		before(:each) do
			expect(STDIN).to receive(:gets).and_return "1"
			expect(STDOUT).to receive(:puts).with "You selected a Mars Bar. The price is £1.0."
			machine.get_product_choice
		end

		it 'confirms if payment is exactly correct.' do
			expect(STDIN).to receive(:gets).and_return "£1"
			expect(STDOUT).to receive(:puts).with "You inserted £1."
			expect(STDOUT).to receive(:puts).with "You just bought a Mars Bar!"
			machine.get_payment
			expect(machine.check_equal_amount).to be_truthy
			machine.check_payment
		end

		it 'takes money as payment from the user.' do
			machine.accept_coins("£1")
			expect(machine.user.money_count("£1")).to eq 0
			expect(machine.money_count("£1")).to eq 2
		end

		it 'gives a confirmation to the user, if the item is sold.' do
			expect(STDOUT).to receive(:puts).with "You just bought a Mars Bar!"
			machine.confirm_purchase
		end

		it 'returns a message if payment is insufficient, with the amount still due.' do
			expect(STDIN).to receive(:gets).and_return "50p"
			expect(STDOUT).to receive(:puts).with "You inserted 50p."
			expect(STDOUT).to receive(:puts).with "50p more needed!"
			expect(STDOUT).to receive(:puts).with "Please enter a coin, accepted formats: £2, £1, 50p, 20p, 10p, 5p, 2p, 1p."
			machine.get_payment
			expect(machine.check_inferior_amount).to be_truthy
			machine.check_payment
		end

		it 'returns a message if payment is more than needed, with the change.' do
			expect(STDIN).to receive(:gets).and_return "50p"
			expect(STDOUT).to receive(:puts).with "You inserted 50p."
			expect(STDOUT).to receive(:puts).with "50p more needed!"
			expect(STDOUT).to receive(:puts).with "Please enter a coin, accepted formats: £2, £1, 50p, 20p, 10p, 5p, 2p, 1p."
			expect(STDIN).to receive(:gets).and_return "£1"
			expect(STDOUT).to receive(:puts).with "You inserted £1."
			expect(STDOUT).to receive(:puts).with "You just bought a Mars Bar!"
			expect(STDOUT).to receive(:puts).with "Your change is 50p."
			machine.get_payment
			machine.check_payment
			machine.get_payment
			expect(machine.check_superior_amount).to be_truthy
			machine.check_payment
		end
	end
end