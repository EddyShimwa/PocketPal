class Category < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :payments

  validates :name, presence: true
  validates :icon, presence: true
end
