require_relative 'change_handler'
require_relative 'product_handler'

class User

	include ChangeHandler
	attr_accessor :credit

	def initialize
		change_load
	end

	def change
		@change ||= []
	end

	def credit
		@credit ||= 0
	end

end