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
    carted_product = current_user.carted_products.find_by(id: params[:id], status: "carted")
    carted_product.status = "removed"
    carted_product.save
    render json: {message: "Product removed from cart!"}
  end
end
