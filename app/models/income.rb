class Income < ApplicationRecord
  belongs_to :income_category,   dependent: :destroy
  belongs_to :user
  
  mount_uploader :image, ImageUploader

end
