class Outcome < ApplicationRecord
  belongs_to :outcome_category,   dependent: :destroy
  belongs_to :user
  mount_uploader :image, ImageUploader
end
