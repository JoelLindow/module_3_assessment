module Api
  module V1
    class ItemsController < ApplicationController

      def index
        render json: Item.all
      end

      def create
        render json: Item.create(item_params)
      end

      private

      def item_params
        binding.pry
        params.require(:item).permit(:name, :description, :image_url)
      end
    end
  end
end
