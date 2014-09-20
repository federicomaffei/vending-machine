require 'application'

describe Application do
	let(:app) {Application.new}
	context 'simple user interaction' do
		it 'welcomes the user' do
			expect(STDOUT).to receive(:puts).with "Welcome to Federico's Vending Machine!"
			app.welcome_message
		end

		it 'prompts the user to choose a product' do
			expect(STDOUT).to receive(:puts).with "Please, enter 1 for Mars Bar, 2 for Snickers, 3 for Coca Cola, 4 for Pringles, 5 for Water:"
			app.prompt_product
		end

		it 'prompts the user to input change' do
			expect(STDOUT).to receive(:puts).with "Please enter a coin, accepted formats: £2, £1, 50p, 20p, 10p, 5p, 2p, 1p."
			app.prompt_change
		end
	end

	context 'handling user choices' do
		before(:each) {app.products_load}
		it 'allows the user to select a product by code' do
			expect(STDIN).to receive(:gets).and_return "1"
			expect(STDOUT).to receive(:puts).with "You selected a Mars Bar. The price is 100."
			app.get_product_choice
		end

		it 'handles an invalid product choice' do
			expect(STDIN).to receive(:gets).and_return "wrong"
			expect(STDOUT).to receive(:puts).with "The entered code does not correspond to a product."
			app.get_product_choice
		end

		it 'allows the user to put money in the machine.' do
			expect(STDIN).to receive(:gets).and_return "£2"
			expect(STDOUT).to receive(:puts).with "You inserted £2."
			app.get_payment
		end

		it 'handles an invalid coin input.' do
			expect(STDIN).to receive(:gets).and_return "wrong"
			expect(STDOUT).to receive(:puts).with "The entered coin is not valid."
			app.get_payment
		end
	end

	context 'handling payment logic' do
		before(:each) do
			app.products_load
			expect(STDIN).to receive(:gets).and_return "1"
			expect(STDOUT).to receive(:puts).with "You selected a Mars Bar. The price is 100."
			app.get_product_choice
		end

		it 'confirms if payment is exactly correct.' do
			expect(STDIN).to receive(:gets).and_return "£1"
			expect(STDOUT).to receive(:puts).with "You inserted £1."
			expect(STDOUT).to receive(:puts).with "You just bought a Mars Bar!"
			app.get_payment
			app.check_payment
		end

		it 'returns a message if payment is insufficient, with the amount still due.' do
			expect(STDIN).to receive(:gets).and_return "50p"
			expect(STDOUT).to receive(:puts).with "You inserted 50p."
			expect(STDOUT).to receive(:puts).with "50p more needed!"
			expect(STDOUT).to receive(:puts).with "Please enter a coin, accepted formats: £2, £1, 50p, 20p, 10p, 5p, 2p, 1p."
			app.get_payment
			app.check_payment
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
			app.get_payment
			app.check_payment
			app.get_payment
			app.check_payment
		end
		
		it 'gives a confirmation to the user, if the item is sold.' do
			expect(STDOUT).to receive(:puts).with "You just bought a Mars Bar!"
			app.confirm_purchase
		end
	end
end