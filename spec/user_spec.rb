require 'user'

describe User do
	let(:user) {User.new}
	context 'initially' do
	
		it 'has 1 £2 coin.' do
			expect(user.money_count('£2')).to eq 1
		end

		it 'has 1 £1 coin.' do
			expect(user.money_count('£1')).to eq 1
		end

		it 'has 1 50p coin.' do
			expect(user.money_count('50p')).to eq 2
		end

		it 'has 1 20p coin.' do
			expect(user.money_count('20p')).to eq 5
		end

		it 'has 1 10p coin.' do
			expect(user.money_count('10p')).to eq 5
		end

		it 'has 1 5p coin.' do
			expect(user.money_count('5p')).to eq 5
		end

		it 'has 1 2p coin.' do
			expect(user.money_count('2p')).to eq 5
		end

		it 'has 1 1p coin.' do
			expect(user.money_count('1p')).to eq 5
		end
	end

	context 'user credit' do
		it 'initially has no credit.' do
			expect(user.credit).to eq 0
		end
	end
end