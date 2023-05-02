require 'rails_helper'

RSpec.describe "payments/new", type: :view do
  before(:each) do
    assign(:payment, Payment.new(
      name: "MyString",
      amount: "9.99",
      user: nil,
      category: nil
    ))
  end

  it "renders new payment form" do
    render

    assert_select "form[action=?][method=?]", payments_path, "post" do

      assert_select "input[name=?]", "payment[name]"

      assert_select "input[name=?]", "payment[amount]"

      assert_select "input[name=?]", "payment[user_id]"

      assert_select "input[name=?]", "payment[category_id]"
    end
  end
end
