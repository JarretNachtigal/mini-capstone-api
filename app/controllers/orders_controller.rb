class OrdersController < ApplicationController
  def create
    order = Order.new(
      user_id: params["user_id"],
      product_id: params["product_id"],
      quantity: params["quantity"],
      subtotal: params["subtotal"],
      tax: params["tax"],
      total: params["total"]
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
