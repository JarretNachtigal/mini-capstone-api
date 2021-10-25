class OrdersController < ApplicationController
  def create
    # user = current_user.id # 
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
    
    orders = Order.all
    render json: orders.as_json
  end

  def index
    order = Order.find(params["id"])
    render json: order
  end
end
