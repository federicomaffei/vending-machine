require './lib/change'

describe Change do
	context 'change type attributes.' do
		let(:change) {Change.new('2£')}
		it 'has a coin type' do
			expect(change.coin_type).to eq '2£'
		end

		it 'has a value expressed in pence.' do
			expect(change.value).to eq 200
		end
	end
end