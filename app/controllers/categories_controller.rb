class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]

  # GET /categories or /categories.json
  def index
    @categories = Category.all
    @total_amounts = {}

    @categories.each do |category|
      payments = Payment.where(category_id: category.id)
      total_amount = payments.sum(:amount)
      @total_amounts[category.id] = total_amount
    end
  end

  # GET /categories/1 or /categories/1.json
  def show
    @payments = Payment.where(category_id: @category)
    @total_amount = @payments.sum(:amount)
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # POST /categories or /categories.json
  def create
    @category = Category.new(category_params)
    @category.user_id = current_user.id

    if @category.save
      flash[:notice] = 'Category created successfully'
      redirect_to categories_path
    else
      render :new
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to authenticated_root_path
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :icon, :user_id)
  end
end
