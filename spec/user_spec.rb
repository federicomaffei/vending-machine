require 'user'

describe User do
	let(:user) {User.new}
	context 'initially' do
		it 'has no products when he gets to the vending machine.' do
			expect(user.products).to be_empty
		end
		it 'has 1 £2 coin.' do
			expect(user.change_count('£2')).to eq 1
		end
		it 'has 1 £1 coin.' do
			expect(user.change_count('£1')).to eq 1
		end
		it 'has 1 50p coin.' do
			expect(user.change_count('50p')).to eq 2
		end
		it 'has 1 20p coin.' do
			expect(user.change_count('20p')).to eq 5
		end
		it 'has 1 10p coin.' do
			expect(user.change_count('10p')).to eq 5
		end
		it 'has 1 5p coin.' do
			expect(user.change_count('5p')).to eq 5
		end
		it 'has 1 2p coin.' do
			expect(user.change_count('2p')).to eq 5
		end
		it 'has 1 1p coin.' do
			expect(user.change_count('1p')).to eq 5
		end	
	end
end