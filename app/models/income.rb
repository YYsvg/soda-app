class Income < ApplicationRecord
  belongs_to :income_category
  belongs_to :user     ,optional: true
  
  mount_uploader :image, ImageUploader
end
