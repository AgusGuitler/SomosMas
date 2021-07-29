# frozen_string_literal: true

class Testimonial < ApplicationRecord
  acts_as_paranoid
  has_one_attached :image
  # Validations
  validates :name,
            :content,
            presence: true
end
