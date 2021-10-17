module Api
  module V1
    class PlantsController < ApplicationController
      def search
        Plant.joins(config: :farm).order(config: [ farm: [le_rate: :desc]])

      end

      private

      def search_params
        params.permit!(:le_rate)
      end
    end
  end
end
