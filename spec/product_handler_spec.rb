require 'product_handler'
require 'error'

class ProductModuleHolder; include ProductHandler; end

describe ProductHandler do
	let(:product_handler) {ProductModuleHolder.new}
	let(:mars_bar) {Product.new('Mars Bar', 100, "1", 10)}
	context 'when initialized' do
		it 'has a capacity of 50 slots for products by default.' do
			expect(product_handler.capacity).to eq 50
		end

		it 'when created it is empty (has no products stored).' do
			expect(product_handler).to be_empty	
		end
	end

	context 'initial loading' do
		before(:each) {product_handler.products_load}
		it 'is initially loaded with 10 Mars Bars.' do
			expect(product_handler.product_count('Mars Bar')).to eq 10
		end

		it 'is initially loaded with 10 Snickers.' do
			expect(product_handler.product_count('Snickers')).to eq 10
		end

		it 'is initially loaded with 10 Coca Cola.' do
			expect(product_handler.product_count('Coca Cola')).to eq 10
		end

		it 'is initially loaded with 10 Pringles cans.' do
			expect(product_handler.product_count('Pringles')).to eq 10
		end
		
		it 'is initially loaded with 10 water bottles.' do
			expect(product_handler.product_count('Water')).to eq 10
		end
	end

	context 'product selection and purchase' do
		before(:each) do
			product_handler.products_load
		end

		it 'selects a product by code, if available.' do
			expect(product_handler.valid_product("1").name).to eq 'Mars Bar'
		end

		it 'throws an error if the code entered by the user is invalid.' do
			expect{product_handler.valid_product("wrong")}.to raise_exception(InvalidCodeException)
		end

		it 'deletes one product that has been sold from the total.' do
			product_handler.sell_product(mars_bar)
			expect(product_handler.product_count('Mars Bar')).to eq 9
		end
	end
end







