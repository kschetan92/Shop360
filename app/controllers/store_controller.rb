class StoreController < ApplicationController
  skip_before_filter :authorize
  def index
    @products = Product.order(:product_name)
    @cart = current_cart
  end

  def show
    @product = Product.find(params[:id])
  end

  def search_results
    @products = Product.where("product_name LIKE '%#{params[:search_key]}%'")
  end
end
