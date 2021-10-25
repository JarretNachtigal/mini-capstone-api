class OrdersController < ApplicationController
  before_action :authenticate_user

  def create
    product = Product.find(params["product_id"])
    quantity = params["quantity"].to_i
    order = Order.new(
      user_id: current_user.id,
      product_id: params["product_id"],
      quantity: params["quantity"],
      subtotal: product.subtotal(quantity),
      tax: product.tax(quantity),
      total: product.total(quantity)
    )
    if order.save
      render json: order
    else
      render json: { errors: order.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    order = Order.find(params["id"])
    render json: order
  end

  def index
    orders = Order.all
    render json: orders
  end
end
