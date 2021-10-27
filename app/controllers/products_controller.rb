class ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]
  def index
    products = Product.all
    if params[:category]
      category = Category.find_by(name: params[:category])
      products = category.products
      render json: products
    else
      render json: products
    end
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
