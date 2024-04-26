class Outcome < ApplicationRecord
  belongs_to :outcome_category
  belongs_to :user     ,optional: true
  mount_uploader :image, ImageUploader
end
