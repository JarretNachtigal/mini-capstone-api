class ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products.as_json
  end

  def create
    product = Product.new(
      name: params["name"],
      price: params["price"],
      image_url: params["image_url"],
      description: params["description"]
    )
    product.save
    render json: product.as_json
  end

  def show
    product = Product.find(params[:id])
    render json: product.as_json
  end

  def update
    product_id = params["id"]
    product = Product.find_by(id: product_id)
    product.name = params["name"] || product.name
    product.price = params["price"]|| product.price
    product.image_url = params["image_url"]|| product.image_url
    product.description = params["description"]|| product.description

    product.save
    render json: product.as_json
  end

  def destroy
    product_id = params["id"]
    Product.destroy_by(id: product_id)
    render json: { message: "destroyed"}
  end
  # def display_first
  #   products = Product.first
  #   render json: products.as_json
  # end
  # def product_wildcard # product_wildcard/3
  #   product = params["product_id"]
  #   render json: Product.find(product)
  # end
  # def product_query # ?product_id=#
  #   product = params["product_id"]
  #   render json: Product.find(product)
  # end
end
