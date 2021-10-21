class ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products
  end

  def create
    product = Product.new(
      name: params["name"],
      price: params["price"],
      description: params["description"]
    )
    #happy/sad paths, only works with new+save not create
    if product.save
      render json: product
    else
      render json: { errors: product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    product = Product.find(params[:id])
    render json: product
  end

  def update
    product_id = params["id"]
    product = Product.find_by(id: product_id)
    product.name = params["name"] || product.name
    product.price = params["price"]|| product.price
    product.description = params["description"]|| product.description
    product.inventory = params["inventory"] || product.inventory
    
    if product.save
      render json: product
    else
      render json: { errors: product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    product_id = params["id"]
    Product.destroy_by(id: product_id)
    render json: { message: "hakai"}
  end
end
