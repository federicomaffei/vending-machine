require 'application'

describe Application do
	context 'user interaction' do
		let(:app) {Application.new}
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
end