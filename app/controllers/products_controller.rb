class ProductsController < ApplicationController
  def display_products
    products = Product.first
    render json: products.as_json
  end
end
