class Outcome < ApplicationRecord
  belongs_to :outcome_cateogry
  belongs_to :user

  mount_uploader :image, ImageUploader
end
