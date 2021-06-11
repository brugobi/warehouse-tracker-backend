require 'rails_helper'

describe 'Authentication', type: :request do
  describe 'POST /authenticate' do
    it 'authenticate the user' do
      post '/api/v1/authenticate', params: { username: 'User1', password: 'Password' }

      expect(response).to have_http_status(:created)
      expect(json).to eq({
                           'username' => 'User1',
                           'token' => '123'
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
  end
end
