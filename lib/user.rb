require_relative 'change_handler'
require_relative 'product_handler'

class User

	include ChangeHandler, ProductHandler

	attr_accessor :credit

	def initialize
		change_load
	end

	def products
		@products ||= []
	end

	def change
		@change ||= []
	end

	def credit
		@credit ||= 0
	end

end