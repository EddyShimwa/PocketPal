class PaymentsController < ApplicationController
  before_action :authenticate_user!


  # GET /payments or /payments.json
  def index
    @category = Category.find(params[:category_id])
    @payments = Payment.where(category_id: params[:category_id])
    @payments = @category.payments.order(created_at: :desc)
    @total_amount = @payments.sum(:amount)
  end

def new
    @category = Category.find(params[:category_id])
    @payment = @category.payments.new
end

  # POST /payments or /payments.json
  def create
    @category = Category.find(params[:category_id])
    @payment = @category.payments.new(permitted)
    if @payment.save
      flash[:notice] = 'Payment created successfully'
      redirect_to category_payments_path(@category)
      puts "yego man yegoo"
    else
      render :new
      puts "wapi man wapi"
    end

  end

  private
  
    def permitted
      params.require(:payment).permit(:name, :amount, :user_id, :category_id)
    end
      
end
