require './lib/product'

describe Product do
	context 'product attributes' do
		let(:product) {Product.new('Mars Bar', 100, 1, 10)}
		it 'has a name.' do
			expect(product.name).to eq 'Mars Bar'
		end

		it 'has a price, expressed in pence.' do
			expect(product.price).to eq 100
		end

		it 'has a numeric code, that the user can enter to buy it.' do
			expect(product.code).to eq 1
		end

		it 'has a quantity, that means the number of products left.' do
			expect(product.quantity).to eq 10
		end

	end
end