require './lib/change'

describe Change do
	context 'change type attributes.' do
		let(:change) {Change.new('2£', 5)}
		it 'has a coin type' do
			expect(change.coin_type).to eq '2£'
		end

		it 'has a value expressed in pence.' do
			expect(change.value).to eq 200
		end

		it 'return the quantity of coins left.' do
			expect(change.quantity).to eq 5
		end
	end
end