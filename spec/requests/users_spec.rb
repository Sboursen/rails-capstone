require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    before(:example) { get root_path }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('index')
    end

    it 'response body includes title' do
      expect(response.body.include?('Portefeuille')).to be_truthy
    end
  end

  describe 'GET #sign_in' do
    before(:example) { get new_user_session_path }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('devise/sessions/new')
    end

    it 'response body includes title' do
      expect(response.body.include?('LOGIN')).to be_truthy
    end
  end

  describe 'GET #sign_up' do
    before(:example) { get new_user_registration_path }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('devise/registrations/new')
    end

    it 'response body includes title' do
      expect(response.body.include?('REGISTER')).to be_truthy
    end
  end
end
