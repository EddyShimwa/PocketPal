class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :payments, dependent: :destroy
  has_many :categories, dependent: :destroy

  def admin?
    role == "admin"
  end
end
