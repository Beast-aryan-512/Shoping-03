class CheckoutController < ApplicationController

	$product_qty = nil
	$product_id = nil
	def create
		
		product = Product.find(params[:pid])
		$product_id = product.id
		$product_qty = params[:qty]
		total = product.price * $product_qty.to_i
		max = 999999
		if total<max
		@session = Stripe::Checkout::Session.create({
			payment_method_types: ['card'],
			line_items: [{
				name: product.name,
				amount: product.price*100,
				currency: "inr",
				quantity: params[:qty] 
			}],
			mode: 'payment',
			
			success_url: checkout_success_url, 

			cancel_url: checkout_failure_url,

		})
		
		
		redirect_to @session.url
		else
            redirect_to checkout_failure_url
        end
	
		end
		
		def success
				# debugger
			@product = Product.find_by(id: $product_id)
			if @product.present?
				@product.quantity -= $product_qty.to_i
				@product.update(quantity:@product.quantity)
        		PaymentInformationMailer.create_invoice(@product,$product_qty,current_user.email).deliver_now #if response.request.url == "http://localhost:3000/success"
        		$product_qty = nil
        		$product_id = nil
    		end
		
	end
end
