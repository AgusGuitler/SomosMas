class Organization < ApplicationRecord
  # Softdelete
  acts_as_paranoid

  # Active Storage Image
  has_one_attached :image

  # Associations
  has_many :slides

  # Validations
  validates :name, 
            :email, 
            :welcome_text, 
            presence: true
end
