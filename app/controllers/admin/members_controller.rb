# frozen_string_literal: true

module Admin
  class MembersController < ApiController
    def index
    end

    def show
    end

    def create
      if @member.save
        render json: @member, serializer: MemberSerializer, status: :created
      else
        render json: { errors: create_params.errors }, status: :unprocessable_entity
      end
    end

    def update
    end

    def destroy
      if @member.present?
        @member.destroy
      else
        render json: { error: @member.errors }, status: :unprocessable_entity
      end

      head :no_content
    end

    private
        def create_params
          params.permit(
            :name,
            :facebook_url,
            :instagram_url,
            :linkedin_url,
            :description
          )
        end
  end
end
