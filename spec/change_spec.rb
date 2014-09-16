require './lib/change'

describe Change do
	context 'change type attributes' do
		let(:change) {Change.new('2£', 5)}
		it 'has a name' do
			expect(change.name).to eq '2£'
		end

		it 'has a quantity' do
			expect(change.quantity).to eq 5
		end

		it 'has a value expressed in pence' do
			expect(change.value).to eq 200
		end
	end
end