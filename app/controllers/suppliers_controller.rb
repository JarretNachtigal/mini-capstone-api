class SuppliersController < ApplicationController
  def index
    suppliers = Supplier.all
    render json: suppliers.as_json
  end
  def show
    supplier = Supplier.find(params[:id])
    render json: supplier.as_json
  end
  def update
    supplier = Supplier.find(params[:id])
    supplier.name = params["name"] || supplier.name
    supplier.email = params["email"] || supplier.email
    supplier.phone_number = params["phone_number"] || supplier.phone_number
    supplier.save
    render json: supplier.as_json
  end
  def create
    supplier = Supplier.new(
      name: params["name"],
      email: params["email"],
      phone_number: params["phone_number"]
    )
    supplier.save
    render json: supplier.as_json
  end
  def destroy
    supplier_id = params["id"]
    Supplier.destroy_by(id: supplier_id)
    render json: {message: "die die die die"}
  end
end
