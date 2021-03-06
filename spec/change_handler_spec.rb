require 'change_handler'
require 'error'

class ChangeModuleHolder; include ChangeHandler; end

describe ChangeHandler do
	let(:change_handler) {ChangeModuleHolder.new}

	context 'initial change loading' do
		before(:each) {change_handler.change_load}
		it 'can load the machine with 5 £2 coins.' do
			expect(change_handler.money_count('£2')).to eq 1
		end

		it 'can load the machine with 5 £1 coins.' do
			expect(change_handler.money_count('£1')).to eq 1
		end

		it 'can load the machine with 5 50p coins.' do
			expect(change_handler.money_count('50p')).to eq 2
		end

		it 'can load the machine with 5 20p coins.' do
			expect(change_handler.money_count('20p')).to eq 5
		end

		it 'can load the machine with 5 10p coins.' do
			expect(change_handler.money_count('10p')).to eq 5
		end

		it 'can load the machine with 5 5p coins.' do
			expect(change_handler.money_count('5p')).to eq 5
		end

		it 'can load the machine with 5 2p coins.' do
			expect(change_handler.money_count('2p')).to eq 5
		end
		
		it 'can load the machine with 5 1p coins.' do
			expect(change_handler.money_count('1p')).to eq 5
		end
	end

	context 'giving money' do
		before(:each) {change_handler.change_load}
		it 'increases the count of that coin type, if the format is known.' do
			change_handler.give_money("£2")
			expect(change_handler.money_count("£2")).to eq 2
		end

		it 'throws an error if the coin type entered by the user is invalid.' do
			expect{change_handler.give_money("wrong_type")}.to raise_exception(InvalidCoinException)
		end
	end

	context 'taking money' do
		before(:each) {change_handler.change_load}
		it 'decreases the count of that coin type, if the format is known.' do
			change_handler.take_money("£2")
			expect(change_handler.money_count("£2")).to eq 0
		end

		it 'throws an error if trying to give an unavailable type of coin.' do
			change_handler.take_money("£2")
			expect{change_handler.take_money("£2")}.to raise_exception(NoMoreCoinsException)
		end
	end

	context 'giving change back' do
		before(:each) {change_handler.change_load}
		it 'increases user coins according to the due change after purchase.' do
			change_handler.give_change(60)
			expect(change_handler.money_count("50p")).to eq 3
			expect(change_handler.money_count("10p")).to eq 6
		end
	end
end






