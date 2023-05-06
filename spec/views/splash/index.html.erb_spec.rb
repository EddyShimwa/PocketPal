require 'rails_helper'

RSpec.describe 'splash/index.html.erb', type: :view do
  it 'displays the PocketPal App heading' do
    render
    expect(rendered).to have_selector('h1', text: 'PocketPal App')
  end

  it 'displays a message prompting the user to sign in or log in' do
    render
    expect(rendered).to have_selector('p', text: 'Please sign in or log in to Get started:')
  end

  it "displays a 'Sign In' button" do
    render
    expect(rendered).to have_selector('a', text: 'Sign In', class: 'btn btn-secondary')
  end

  it "displays a 'Log In' button" do
    render
    expect(rendered).to have_selector('a', text: 'Log In', class: 'btn btn-primary mr-sm-3 mb-3 mb-sm-0')
  end

  it "displays a 'Sign In' button" do
    render
    expect(rendered).to have_selector('a', text: 'Sign In', class: 'btn btn-secondary')
  end
end
