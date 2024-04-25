class Income < ApplicationRecord
  belongs_to :income_category
  belongs_to :user
end
