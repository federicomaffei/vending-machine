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
			expect(STDOUT).to receive(:puts).with "Please enter a coin, accepted formats: 2£, 1£, 50p, 20p, 10p, 5p, 2p, 1p."
			app.prompt_change
		end
	end

	context 'handling user choices' do
		before(:each) {app.machine.product_load}
		it 'allows the user to select a product by code' do
			expect(STDIN).to receive(:gets).and_return "1"
			expect(STDOUT).to receive(:puts).with "You selected a Mars Bar. The price is 100."
			app.get_product_choice
		end

		it 'allows the user to put money in the machine' do
			expect(STDIN).to receive(:gets).and_return "2£"
			expect(STDOUT).to receive(:puts).with "You inserted 2£."
			app.get_payment
		end
	end
end