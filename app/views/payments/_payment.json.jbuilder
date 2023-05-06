json.extract! payment, :id, :name, :amount, :user_id, :category_id, :created_at, :updated_at
json.url payment_url(payment, format: :json)
