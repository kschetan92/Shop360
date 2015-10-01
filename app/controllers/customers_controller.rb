class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy, :remove_photo]
  before_action :logged_in_customer, only: [:index, :edit, :update, :destroy]
  before_action :correct_customer, only: [:edit, :update]
  before_action :admin_customer, only: [:destroy, :index]
  before_action :set_cities, only: [:new, :edit]
  skip_before_filter :authorize

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.paginate(page: params[:page], :per_page => 10)
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        log_in @customer
        flash[:success] = "Registered successfully, Welcome to shop360 #{@customer.first_name}"
        format.html { redirect_to @customer }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update_attributes(customer_params)
        flash[:success] = "Sccessfully Updated."
        format.html { redirect_to @customer }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      flash[:success] = "Customer deleted Sccessfully."
      format.html { redirect_to @customer }
      format.json { head :no_content }
    end
  end

  def remove_photo
    @customer.avatar = nil
    @customer.save
    flash[:success] = "Photo removed successfully"
    redirect_to @customer
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    def set_cities
      @cities = City.order(:city_name)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :email, :mobile, :address,  :city_id, :pincode, :date_of_birth, :avatar, :password, :password_confirmation)
    end

    def logged_in_customer
      unless logged_in?
        store_location
        flash[:danger] = "You are not logged in, Please log in"
        redirect_to login_url
      end
    end

    def correct_customer
      @customer = Customer.find(params[:id])
      if current_customer?(@customer)

      else
        flash[:warning] = "Not allowed to handle others Profiles."
        redirect_to(root_url)
      end
    end

    def admin_customer
      redirect_to(root_url) unless current_customer.admin?
    end
end
