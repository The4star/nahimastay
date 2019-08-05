class ChargesController < ApplicationController
  def new
  end

  def create
    # Amount in cents
    @amount = 2500
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: "Customer Upgrading to Premium",
      currency: "usd",
    })

    user = current_user
    user.role = Role.find(3)
    user.save!

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
