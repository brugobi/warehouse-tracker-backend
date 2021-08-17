module Api
  module V1
    class ItemsController < ApplicationController
      #before_action :authenticate_request!

      MAX_PAGINATION_LIMIT = 100
      def index
        items = Item.limit(limit).offset(params[:offset])
        render json: ItemsRepresenter.new(items).as_json
      end

      def create
        # current_user = current_user!
        #item = current_user.items.create(item_params)
        item = Item.create(item_params)
        if item.save
          render json: ItemRepresenter.new(item).as_json, status: :created
        else
          render json: item.errors, status: :unprocessable_entity
        end
      end

      def show
        item = Item.find(params[:id])
        render json: ItemRepresenter.new(item).as_json
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

      def limit
        [
          params.fetch(:limit, MAX_PAGINATION_LIMIT).to_i,
          MAX_PAGINATION_LIMIT
        ].min
      end

      def item_params
        params.permit(:name, :code, :ideal_quantity, :current_quantity, :user_id)
      end

      def set_item
        @item = Item.find(params[:id])
      end

      def no_user
        render json: { error: 'User not found' }, status: :unauthorized
      end
    end
  end
end
