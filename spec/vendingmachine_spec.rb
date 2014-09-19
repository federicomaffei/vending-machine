require 'vendingmachine'

describe VendingMachine do
	let(:machine) {VendingMachine.new}
	let(:mars_bar) {Product.new('Mars Bar', 100, "1", 10)}
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
		it 'is initially loaded with 5 £2 coins.' do
			expect(machine.change_count('£2')).to eq 5
		end
		it 'is initially loaded with 5 £1 coins.' do
			expect(machine.change_count('£1')).to eq 5
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

		it 'selects a product by code, if available.' do
			expect(machine.select_item("1").name).to eq 'Mars Bar'
		end

		it 'processes and accepts money, if the format is known.' do
			expect(machine.accept_coins("2£")).to eq 200
			expect(machine.change.length).to eq 1
		end

		it 'deletes one product that has been sold from the total.' do
			machine.sell_item(mars_bar)
			expect(machine.item_count('Mars Bar')).to eq 9
		end

		it 'checks if the change inserted by the user is exactly enough for the item.' do
			machine.select_item("1")
			machine.accept_coins("1£")
			expect(machine.check_equal_amount).to be_truthy
		end

		it 'checks if the change inserted by the user is less than enough for the item.' do
			machine.select_item("1")
			machine.accept_coins("50p")
			expect(machine.check_inferior_amount).to be_truthy
		end
	end
end






