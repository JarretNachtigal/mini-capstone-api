class ProductsController < ApplicationController
  def display_products
    products = Product.all
    render json: products.as_json
  end
end
