require_relative 'product'
require_relative 'change'

module ProductHandler

	CAPACITY = 50
	
	attr_accessor :capacity

	def capacity
		@capacity = CAPACITY
	end

	def products
		@products ||= []
	end

	def empty?
		products.count == 0 ? true : false
	end

	def products_load
		Product::PRODUCTS.each {|product| products << Product.new(product[:name], product[:price], product[:code], product[:quantity])}
	end

	def product_count(name)
		products.select {|product| product.name == name}.first.quantity
	end

	def select_product(code)
		raise InvalidCodeException.new if !Product::ALLOWED_PRODUCTS.include?(code)
		product_selection(code)
	end

	def product_selection(code)
		products.select {|product| product.code == code}.first
	end

	def sell_product(product)
		select_product(product.code).quantity -= 1
	end
end