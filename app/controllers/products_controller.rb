class ProductsController < ApplicationController
  def display_products
    products = Product.all
    render json: products.as_json
  end
  def display_first
    products = Product.first
    render json: products.as_json
  end
end
