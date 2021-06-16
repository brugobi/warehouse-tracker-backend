module Api
  module V1
    class ItemsController < ApplicationController
      MAX_PAGINATION_LIMIT = 100

      before_action :set_item, only: %i[show update destroy]

      def index
        @items = Item.all
        render json: ItemsRepresenter.new(@items).as_json
      end

      def create
        @item = Item.create(item_params)

        if @item.save
          render json: ItemRepresenter.new(@item).as_json, status: :created
        else
          render json: @item.errors, status: :unprocessable_entity
        end
      end

      def show
        render json: ItemRepresenter.new(@item).as_json
      end

      def update
        @item.update(item_params)
        head :no_content
      end

      def destroy
        @item.destroy
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
        params.permit(:name, :code, :ideal_quantity, :current_quantity)
      end

      def set_item
        @item = Item.find(params[:id])
      end
    end
  end
end
