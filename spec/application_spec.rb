require 'application'

describe Application do
	context 'user interaction' do
		let(:app) {Application.new}
		it 'welcomes the user' do
			expect(STDOUT).to receive(:puts).with "Welcome to Federico's Vending Machine!"
			app.welcome_message
		end
	end
	
end