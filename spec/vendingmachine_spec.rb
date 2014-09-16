require 'vendingmachine'

describe VendingMachine do
	let(:machine) {VendingMachine.new}
	context 'when initialized' do
		it 'has a capacity of 50 slots for items by default.' do
			expect(machine.capacity).to eq 50
		end
		it 'when created it is empty (has no items stored).' do
			expect(machine.items.length).to eq 0
		end
	end

	context 'initial loading' do
		before(:each) {machine.initial_product_load}
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
		before(:each) {machine.initial_change_load}
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
end