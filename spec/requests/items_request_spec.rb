require 'rails_helper'

RSpec.describe 'Items', type: :request do
  before do
    5.times do |i|
      FactoryBot.create(
        :item,
        name: "REST APIs in Rails-#{i + 1}",
        code: "CODE-#{i + 1}",
        ideal_quantity: 20,
        current_quantity: 15,
        user: 'User1'
      )
    end
  end

  let(:user) do
    FactoryBot.create(
      :user,
      username: 'User1',
      password: 'password',
      password_confirmation: 'password'
    )
  end

  let(:token) { AuthenticationTokenService.decode(user.id) }
  describe 'GET /items' do
    it 'it returns all items' do
      get '/api/v1/items',
          headers: {
            'Authorization' => "Bearer #{token}"
          }
      expect(response).to have_http_status(:ok)
      expect(response_body.size).to eq(2)
      expect(response_body['data'].size).to eq(5)
    end
  end

  describe 'GET /item/id' do
    it 'returns a single item' do
      get "/api/v1/items/#{Item.last.slug}",
          headers: {
            'Authorization' => "Bearer #{token}"
          }
      expect(response).to have_http_status(:ok)
    end

    it 'returns error if record is not found' do
      get '/api/v1/items/no-record',
          headers: {
            'Authorization' => "Bearer #{token}"
          }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
# require 'rails_helper'

# RSpec.describe 'Items', type: :request do
#   # initialize test database
#   let!(:items) { create_list(:item, 5) }
#   let(:item_id) { items.first.id }
#   # GET /item
#   describe 'GET /items' do
#     before { get '/api/v1/items' }

#     it 'returns list of items' do
#       expect(json).not_to be_empty
#       expect(json.size).to eq(5)
#     end

#     it 'returns status code 200' do
#       expect(response).to have_http_status(200)
#     end
#   end

#   describe 'GET /items/:id' do
#     before { get "/api/v1/items/#{item_id}" }

#     context 'when a book exists' do
#       it 'returns status code 200' do
#         expect(response).to have_http_status(200)
#       end

#       it 'returns the item' do
#         expect(json['id']).to eq(item_id)
#       end
#     end

#     describe 'GET /items/:id' do
#       before { get "/api/v1/items/#{item_id}" }

#       context 'when book does not exist' do
#         let(:item_id) { 0 }

#         it 'returns status code 404' do
#           expect(response).to have_http_status(404)
#         end

#         it 'returns a not found message' do
#           expect(response.body).to include("Couldn't find Item with 'id'=0")
#         end
#       end
#     end
#   end

#   # POST /item
#   describe 'POST /items/:id' do
#     let(:valid_attributes) do
#       { name: 'alcohol70', code: '@33', current_quantity: 10, ideal_quantity: 20 }
#     end

#     context 'when the request attributes are valid' do
#       before { post '/api/v1/items', params: valid_attributes }

#       it 'returns status code 201' do
#         expect(response).to have_http_status(201)
#       end
#     end

#     context 'when the request is invalid' do
#       before { post '/api/v1/items', params: {}, headers: headers }

#       it 'returns status code 422' do
#         expect(response).to have_http_status(422)
#       end

#       it 'returns a failure message' do
#         expect(response.body).to include("can't be blank")
#       end
#     end
#   end

#   describe 'PUT /items/:id' do
#     let(:valid_attributes) { { name: 'alcohol70' } }

#     before { put "/api/v1/items/#{item_id}", params: valid_attributes, headers: headers }

#     context 'when item exists' do
#       it 'returns status code 204' do
#         expect(response).to have_http_status(204)
#       end

#       it 'update item' do
#         updated_item = Item.find(item_id)
#         expect(updated_item.name).to match(/alcohol70/)
#       end
#     end

#     context 'when item doesnt exist' do
#       let(:item_id) { 0 }

#       it 'returns status code 404' do
#         expect(response).to have_http_status(404)
#       end

#       it 'returns a not found item message' do
#         expect(response.body).to include("Couldn't find Item with 'id'=0")
#       end
#     end
#   end
#   # DELETE /item/:id
#   describe 'DELETE /item/:id' do
#     before { delete "/api/v1/items/#{item_id}" }

#     it 'returns status code 204' do
#       expect(response).to have_http_status(204)
#     end
#   end
# end
