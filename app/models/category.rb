class Category < ApplicationRecord
  belongs_to :user
  has_many :payment_categories
  has_many :payments, through: :payment_categories

  validates :name, presence: true
  validates :icon, presence: true
end
