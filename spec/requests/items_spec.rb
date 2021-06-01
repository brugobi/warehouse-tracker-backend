require 'rails_helper'

RSpec.describe 'Items', type: :request do
  # initialize test database
  let!(:item_id) { items.first.id }

  # GET /item
  describe 'GET /items' do
    before { get 'api/v1/items' }

    it 'returns items' do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end
    it 'returns ststus code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # POST /item
  describe 'POST /item' do
    let!(:valid_name) { { name: 'alcohol70%' } }

    context 'when the request is valid' do
      before { post 'api/v1/items', params: valid_name }

      it 'create a item' do
        expect(json['name']).to eq('alcohol70%')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post 'api/v1/items', params: { name: '' } }

      it 'returns a validation failure message' do
        expect(response.body).to include('It is too short (minimum is 3 characteres')
      end
    end
  end

  # DELETE /item/:id
  describe 'DELETE /items/:id' do
    before { delete "api/v1/items/#{item_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
