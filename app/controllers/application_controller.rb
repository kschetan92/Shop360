class ApplicationController < ActionController::Base
  before_filter :authorize
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  include CartsHelper

  private

  def authorize
    unless Customer.find_by_id(session[:customer_id])
      flash[:warning] = "Please login to access cart"
      redirect_to login_url
    end
  end
end
