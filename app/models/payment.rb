class Payment < ApplicationRecord
  belongs_to :user
  has_many :payment_categories
  has_many :categories, through: :payment_categories

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
