# # Create sample users
# User.create(name: "John Doe", email: "john@example.com", password: "password")
# User.create(name: "Jane Smith", email: "jane@example.com", password: "password")

# # Create some sample categories
# Category.create(name: "Food", icon: "🍔")
# Category.create(name: "Shopping", icon: "🛍️")
# Category.create(name: "Entertainment", icon: "🎬")

# # Create some sample transactions
# Payment.create(name: "Lunch at McDonald's", amount: 7.99)
# Payment.create(name: "Groceries at Walmart", amount: 35.78)
# Payment.create(name: "Movie tickets", amount: 12.50)

# # Associate transactions with categories
PaymentCategory.create(category_id: 1, payment_id: 1)
PaymentCategory.create(category_id: 2, payment_id: 2)
PaymentCategory.create(category_id: 3, payment_id: 3)
