require 'vendingmachine'

describe VendingMachine do
	let(:machine) {VendingMachine.new}
	context 'when initialized' do
		it 'has a capacity of 50 slots for items by default.' do
			expect(machine.capacity).to eq 50
		end
		it 'when created it is empty (has no items stored).' do
			expect(machine).to be_empty	
		end
	end

	context 'initial loading' do
		before(:each) {machine.product_load}
		it 'is initially loaded with 10 Mars Bars.' do
			expect(machine.item_count('Mars Bar')).to eq 10
		end
		it 'is initially loaded with 10 Snickers.' do
			expect(machine.item_count('Snickers')).to eq 10
		end
		it 'is initially loaded with 10 Coca Cola.' do
			expect(machine.item_count('Coca Cola')).to eq 10
		end
		it 'is initially loaded with 10 Pringles cans.' do
			expect(machine.item_count('Pringles')).to eq 10
		end
		it 'is initially loaded with 10 water bottles.' do
			expect(machine.item_count('Water')).to eq 10
		end
	end

	context 'initial change loading' do
		before(:each) {machine.change_load}
		it 'is initially loaded with 5 2£ coins.' do
			expect(machine.change_count('2£')).to eq 5
		end
		it 'is initially loaded with 5 1£ coins.' do
			expect(machine.change_count('1£')).to eq 5
		end
		it 'is initially loaded with 5 50p coins.' do
			expect(machine.change_count('50p')).to eq 5
		end
		it 'is initially loaded with 5 20p coins.' do
			expect(machine.change_count('20p')).to eq 5
		end
		it 'is initially loaded with 5 10p coins.' do
			expect(machine.change_count('10p')).to eq 5
		end
		it 'is initially loaded with 5 5p coins.' do
			expect(machine.change_count('5p')).to eq 5
		end
		it 'is initially loaded with 5 2p coins.' do
			expect(machine.change_count('2p')).to eq 5
		end
		it 'is initially loaded with 5 1p coins.' do
			expect(machine.change_count('1p')).to eq 5
		end
	end

	context 'product selection and purchase' do
		before(:each) {machine.product_load}
		it 'prompts to choose a product' do
			expect(STDOUT).to receive(:puts).with "Please, enter 1 for Mars Bar, 2 for Snickers, 3 for Coca Cola, 4 for Pringles, 5 for Water:"
			machine.prompt_product
		end

		it 'selects a product by code, if available.' do
			expect(STDIN).to receive(:gets).and_return "1"
			expect(STDOUT).to receive(:puts).with "You selected a Mars Bar. The price is 100."
			machine.select_item
		end

		it 'prompts for money, in a known format.' do
			expect(STDOUT).to receive(:puts).with "Please enter a coin, accepted formats: 2£, 1£, 50p, 20p, 10p, 5p, 2p, 1p."
			machine.prompt_coins
		end

		it 'processes and accepts money, if the format is known.' do
			expect(STDIN).to receive(:gets).and_return "2£"
			expect(STDOUT).to receive(:puts).with "You inserted 2£."
			machine.accept_coins
			expect(machine.change.length).to eq 1
		end

		it 'returns a message with the product that the just bought.' do
			expect(STDIN).to receive(:gets).and_return "1"
			expect(STDOUT).to receive(:puts).with "You selected a Mars Bar. The price is 100."
			expect(STDOUT).to receive(:puts).with "You just bought a Mars Bar!"
			machine.sell_item(machine.select_item)
			expect(machine.item_count('Mars Bar')).to eq 9
		end

		it 'checks if the change inserted by the user is exactly enough for the item.' do
			expect(STDIN).to receive(:gets).and_return "1"
			expect(STDOUT).to receive(:puts).with "You selected a Mars Bar. The price is 100."
			expect(STDIN).to receive(:gets).and_return "1£"
			expect(STDOUT).to receive(:puts).with "You inserted 1£."
			machine.select_item
			machine.accept_coins
			expect(machine.check_equal_amount).to be_truthy
		end

		it 'checks if the change inserted by the user is more than enough for the item.' do
			expect(STDIN).to receive(:gets).and_return "3"
			expect(STDOUT).to receive(:puts).with "You selected a Coca Cola. The price is 80."
			expect(STDIN).to receive(:gets).and_return "1£"
			expect(STDOUT).to receive(:puts).with "You inserted 1£."
			expect(STDOUT).to receive(:puts).with "Your change is 20p."
			machine.select_item
			machine.accept_coins
			machine.compute_due_change
			expect(machine.check_superior_amount).to be_truthy
		end

		it 'checks if the change inserted by the user is less than enough for the item.' do
			expect(STDIN).to receive(:gets).and_return "1"
			expect(STDOUT).to receive(:puts).with "You selected a Mars Bar. The price is 100."
			expect(STDIN).to receive(:gets).and_return "50p"
			expect(STDOUT).to receive(:puts).with "You inserted 50p."
			expect(STDOUT).to receive(:puts).with "50p more needed!"
			machine.select_item
			machine.accept_coins
			machine.compute_missing_change
			expect(machine.check_inferior_amount).to be_truthy
		end
	end
end






