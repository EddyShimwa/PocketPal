class PaymentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: %i[index new create]

  rescue_from ActiveRecord::RecordNotFound, with: :category_not_found

  def index
    @payments = @category.payments.order(created_at: :desc)
    @total_amount = @payments.sum(:amount)
    @payment = Payment.new
  end

  def new
    @payment = Payment.new
    @payment_category = PaymentCategory.new
    @categories = Category.all
  end

  def create
    @payment = Payment.new(payment_params)
    @payment.user_id = current_user.id
    @payment.save!

    @payment_category = @category.payment_categories.new(payment: @payment)
    if @payment_category.save
      redirect_to category_payments_path(@category), notice: 'Payment was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_category
    @category = Category.find_by(id: params[:category_id]) || Category.first
  end

  def category_not_found
    flash[:alert] = 'Category not found'
    redirect_to categories_url
  end

  def payment_params
    params.require(:payment).permit(:name, :amount, :user_id, :category_id)
  end
end
