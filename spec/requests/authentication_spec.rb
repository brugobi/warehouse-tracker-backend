require 'rails_helper'

describe 'Authentication', type: :request do
  describe 'POST /authenticate' do
    let(:user) { FactoryBot.create(:user, username: 'User1', password: 'password') }

    it 'authenticate the user' do
      post '/api/v1/authenticate', params: { username: user.username, password: 'password' }

      expect(response).to have_http_status(:created)
      expect(json).to eq({
                           'username' => user.username,
                           'token' =>
                           'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.DiPWrOKsx3sPeVClrm_j07XNdSYHgBa3Qctosdxax3w'
                         })
    end

    it 'returns error when password is missing' do
      post '/api/v1/authenticate', params: { username: 'User1' }

      expect(response).to have_http_status(:unprocessable_entity)
      expect(json).to eq({ 'error' => 'param is missing or the value is empty: password' })
    end

    it 'returns error when the username is missing' do
      post '/api/v1/authenticate', params: { password: 'Password' }

      expect(response).to have_http_status(:unprocessable_entity)
      expect(json).to eq({ 'error' => 'param is missing or the value is empty: username' })
    end

    it 'returns error when password is incorrect' do
      post '/api/v1/authenticate', params: { username: user.username, password: 'incorrect' }
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
