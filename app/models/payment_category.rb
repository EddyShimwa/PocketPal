class PaymentCategory < ApplicationRecord
  belongs_to :payment
  belongs_to :category
end
