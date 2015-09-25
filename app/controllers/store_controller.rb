class StoreController < ApplicationController
  def index
    @products = Product.order(:product_name)
  end

  def show
    @product = Product.find(params[:id])
  end

  def search_results
    @products = Product.where("product_name LIKE '%#{params[:search_key]}%'")
  end
end
