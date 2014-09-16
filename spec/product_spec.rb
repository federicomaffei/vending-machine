require './lib/product'

describe Product do
	context 'product attributes' do
		let(:product) {Product.new('Mars Bar', 100, 1)}
		it 'has a name.' do
			expect(product.name).to eq 'Mars Bar'
		end
		it 'has a price, expressed in pence.' do
			expect(product.price).to eq 100
		end
		it 'has a numeric code, that the user can enter to buy it.' do
			expect(product.code).to eq 1
		end
	end
	context 'product availability' do
		let(:product) {Product.new('Mars Bar', 100, 1)}
		it 'is available when created.' do
			expect(product).not_to be_sold
		end
		it 'is not available when sold.' do
			product.sell
			expect(product).to be_sold
		end
		it 'is available when stocked again.' do
			product.sell
			product.stock
			expect(product).not_to be_sold
		end
	end
end