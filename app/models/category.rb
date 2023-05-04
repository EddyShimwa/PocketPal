class Category < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  has_many :payment_categories
  has_many :payments, foreign_key: 'category_id', through: :payment_categories

  validates :name, presence: true
  validates :icon, presence: true
end
