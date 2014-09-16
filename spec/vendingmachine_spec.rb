require 'vendingmachine'

describe VendingMachine do
	context 'items listing' do
		let(:machine) {VendingMachine.new}
		it 'has a capacity of 100 slots for items by default.' do
			expect(machine.items.length).to eq 100
		end
		it 'when created it is empty.' do
			expect(machine).to be_empty
		end
	end
end