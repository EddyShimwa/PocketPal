require 'rails_helper'

RSpec.describe "payments/edit", type: :view do
  let(:payment) {
    Payment.create!(
      name: "MyString",
      amount: "9.99",
      user: nil,
      category: nil
    )
  }

  before(:each) do
    assign(:payment, payment)
  end

  it "renders the edit payment form" do
    render

    assert_select "form[action=?][method=?]", payment_path(payment), "post" do

      assert_select "input[name=?]", "payment[name]"

      assert_select "input[name=?]", "payment[amount]"

      assert_select "input[name=?]", "payment[user_id]"

      assert_select "input[name=?]", "payment[category_id]"
    end
  end
end
