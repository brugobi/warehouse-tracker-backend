module Api
  module V1
    class ItemsController < ApplicationController
      before_action :authenticate_request!
      rescue_from NoMethodError, with: :no_user
      MAX_PAGINATION_LIMIT = 100

      def index
        current_user = current_user!
        items = Item.limit(limit).offset(params[:offset])

        render json: ItemsRepresenter.new(items, current_user.id).as_json
      end

      def create
        current_user = current_user!

        item = current_user.items.create(item_params)

        if item.save
          render json: ItemRepresenter.new(item).as_json, status: :created
        else
          render json: item.errors, status: :unprocessable_entity
        end
      end

      def show
        current_user = current_user!
        item = Item.find(params[:id])

        render json: ItemRepresenter.new(item, current_user.id).as_json
      end

      def destroy
        Item.find(params[:id]).destroy!

        head :no_content
      end

      def update
        Item.find(params[:id]).update!

        head :no_content
      end

      private

      # def authenticate_user!
      #   # Authentication: Bearer <token>
      #   token, _options = token_and_options(request)
      #   user_id = AuthenticationTokenService.decode_token(token)
      #   User.find(user_id)
      #   ActiveRecord::RecordNotFound
      # rescue ActiveRecord::RecordNotFound
      #   render status: :unauthorized
      # end

      def limit
        [
          params.fetch(:limit, MAX_PAGINATION_LIMIT).to_i,
          MAX_PAGINATION_LIMIT
        ].min
      end

      def item_params
        params.permit(:name, :code, :ideal_quantity, :current_quantity)
      end

      def set_item
        @item = Item.find(params[:id])
      end
    end
  end
end
