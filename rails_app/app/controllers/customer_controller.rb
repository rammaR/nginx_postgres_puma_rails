class CustomerController < ApplicationController

  before_action :authenticate_member!, except: [:index]

  def index
    @customer = Customer.new
  end

  #GET /customers/1
  def show
    #@customer = Customers.find_by_id(params[:id])
  end

  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to customer_url(@customer), notice: "Customer was successfully created." }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def customer_params
      params.require(:customer).permit(:name)
    end
end
