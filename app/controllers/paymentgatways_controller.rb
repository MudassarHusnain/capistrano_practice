class PaymentgatwaysController < ApplicationController

    # app/controllers/payments_controller.rb
    def create
      # Amount in cents
      @amount = 500
      stripeEmail = "mudassarhusnain64@gmail.com"

      customer = Stripe::Customer.create(
        email: params[:stripeEmail],
        # source: params[:stripeToken]
      )
  
      charge = Stripe::Charge.create(
        customer: customer.id,
        amount: @amount,
        description: 'Rails Stripe customer',
        currency: 'usd'
      )
  
      rescue Stripe::CardError => e
        flash[:error] = e.message
        redirect_to new_payment_path
    end
end
