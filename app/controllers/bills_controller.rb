class BillsController < ApplicationController
  before_action :all_bills, only: [:index, :create, :update, :destroy]
  before_action :set_bill, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
  end

  def show
  end

  def new
    @bill = current_user.bills.new
  end

  def edit
  end
  
  def create
    @bill = current_user.bills.create(bill_params)
  end

  def update
    @bill.update_attributes(bill_params)
  end

  def destroy
    @bill.destroy
    respond_to do |format|
      format.html do
        redirect_to @bills
      end
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill
      @bill = Bill.find(params[:id])
    end

    def all_bills
      @bills = Bill.all
    end

    def bill_params
      params.require(:bill).permit(:name, :price)
    end
end
