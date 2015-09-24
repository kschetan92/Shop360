class SessionsController < ApplicationController
  def new
  end

  def create
    customer = Customer.find_by(email: params[:session][:email].downcase)
    if customer and customer.authenticate(params[:session][:password])
      log_in customer
      flash[:success] = "You are now logged in, Welcome to Shop360"
      params[:session][:remember_me] == '1' ? remember(customer) : forget(customer)
      redirect_back_or home_path
    else
      flash.now[:danger] = "Invalid email or password combination"
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    flash[:success] = "You are now logged out, Come back again for more"
    redirect_to root_url
  end
end
