class Income < ApplicationRecord
  belongs_to :income_category
  belongs_to :user
  
  mount_uploader :image, ImageUploader
end
