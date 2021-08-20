# frozen_string_literal: true

module Admin
  class ActivitiesController < ApiController
    def index
    end

    def show
    end

    def update
      if @activity.update(update_params)
        render json: @activity, serializer: Admin::ActivitySerializer, status: :ok
      else
        render json: @activity.errors, status: :unprocessable_entity
      end
    end

    def create
    end

    def destroy
    end

    private
      def update_params
        params.permit(:name, :content)
      end
  end
end