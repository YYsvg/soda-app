class Outcome < ApplicationRecord
  belongs_to :outcome_category
  belongs_to :user
  mount_uploader :image, ImageUploader
end
