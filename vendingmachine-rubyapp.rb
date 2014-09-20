require_relative './lib/application'

app = Application.new
app.products_load
app.welcome_message
app.prompt_product
app.get_product_choice
app.prompt_change
loop do
	app.get_payment
	if app.check_payment == true
		exit
	end
end
