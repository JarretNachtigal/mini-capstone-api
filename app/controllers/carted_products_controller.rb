class CartedProductsController < ApplicationController
  before_action :authenticate_user

  def index
    cart = CartedProduct.where(user_id: current_user.id )
    cart = cart.where(status: "carted")
    render json: cart.as_json
  end

  def create
    cart = CartedProduct.new(
      product_id: params[:product_id],
      quantity: params[:quantity],
      user_id: current_user.id,
      status: "carted",
      order_id: nil
    )
    if cart.save
      render json: cart.as_json
    else
      render json: { errors: cart.errors.full_messages }
    end
  end

  def destroy
    # cart = CartedProduct.where(user_id: current_user.id)
    # cart.each do |product|
    #   product.status = "removed"
    #   product.save
    # end
    
  end
end
