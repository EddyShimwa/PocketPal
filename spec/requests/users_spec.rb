require 'rails_helper'

RSpec.describe 'Users', type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create(name: 'hassan', email: 'hassan@mail.com', password: 'password', confirmed_at: Time.now) }
  describe 'GET /home' do
    before do
      sign_in user
      get '/'
    end

    it 'should return response status correct (ok)' do
      expect(response).to have_http_status(:ok)
    end

    describe 'PATCH /users/:id' do
      it 'should update the user profile' do
        sign_in user
        patch "/users/#{user.id}", params: { user: { name: 'new name' } }
        user.reload
        expect(user.name).to eq('new name')
      end
    end

    it 'should render the correct template' do
      expect(response).to render_template(:index)
    end
  end
end
