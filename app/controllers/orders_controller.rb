class OrdersController < ApplicationController
  before_action :authenticate_user

  def create
    # products with current user id and status carted
    products = CartedProduct.where(user_id: current_user)
    products = products.where(status: "carted")

    order_total = 0
    order_subtotal = 0
    order_tax = 0
    order_quantity = 0
    products.each do |product|
      order_total += Product.find(product.product_id).total(product.quantity)
      order_subtotal += Product.find(product.product_id).subtotal(product.quantity)
      order_tax += Product.find(product.product_id).tax(product.quantity)
      order_quantity += product.quantity
    end
    order = Order.new(
      user_id: current_user.id,
      quantity: order_quantity,
      subtotal: order_total,
      tax: order_tax,
      total: order_total
    )
    if order.save
      render json: order
      products.each do |product|
        product.order_id = order.id
        product.status = "purchased"
        product.save
      end
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
