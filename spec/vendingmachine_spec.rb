require 'vendingmachine'

describe VendingMachine do
	context 'when initialized' do
		let(:machine) {VendingMachine.new}
		it 'has a capacity of 50 slots for items by default.' do
			expect(machine.items.length).to eq 50
		end
		it 'when created it is empty.' do
			expect(machine).to be_empty
		end
	end
	context 'initial loading' do
		let(:machine) {VendingMachine.new}
		before(:each) {machine.initial_load}
		it 'is initially loaded with 10 Mars Bars' do
			expect(machine.item_count('Mars Bar')).to eq 10
		end
		it 'is initially loaded with 10 Snickers' do
			expect(machine.item_count('Snickers')).to eq 10
		end
		it 'is initially loaded with 10 Coca Cola' do
			expect(machine.item_count('Coca Cola')).to eq 10
		end
		it 'is initially loaded with 10 Pringles cans' do
			expect(machine.item_count('Pringles')).to eq 10
		end
		it 'is initially loaded with 10 water bottles' do
			expect(machine.item_count('Water')).to eq 10
		end
	end
end