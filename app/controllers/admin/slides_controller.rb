# frozen_string_literal: true

module Admin
  class SlidesController < ApiController
    def create
      if @slide.save
        render json: @slide, serializer: SlideSerializer, status: :created
      else
        render json: { error: @slide.errors }, status: :unprocessable_entity
      end
    end
    def update
      @slide.assign_attributes(update_params)
      if @slide.valid?
        @slide.image.purge if params[:image]
        @slide.assign_attributes(update_params)
        @slide.save
        render json: @slide, serializer: Admin::SlideSerializer, status: :ok
      else
        render json: { error: @slide.errors }, status: :unprocessable_entity
      end
    end
    def destroy
      if @slide.present?
        @slide.destroy
      else
        render json: { error: @slide.errors }, status: :unprocessable_entity
      end

      head :no_content
   end

   private
     def create_params
       params.permit(
         :text,
         :image,
         :order
       ).merge(organization: Organization.find_by(name: "Somos Más"))
     end
     def update_params
       params.permit(
           :text,
           :image,
           :order
         )
     end
  end
end
