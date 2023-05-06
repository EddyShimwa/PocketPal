class PaymentCategory < ApplicationRecord
  belongs_to :payment, class_name: 'Payment'
  belongs_to :category, class_name: 'Category'

  def permitted
    params.require(:payment_category).permit(:name, :amount, :user_id, :category_id)
  end
end
