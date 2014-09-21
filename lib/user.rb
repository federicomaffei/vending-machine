require_relative 'change_handler'
require_relative 'product_handler'

class User

	include ChangeHandler, ProductHandler

	def initialize
		self.change_load
	end

	def products
		@products ||= []
	end

	def change
		@change ||= []
	end

end