class OutcomeCategory < ApplicationRecord
  has_many :outcomes ,dependent: :destroy

  scope :category_names, -> { pluck(:name).uniq }
end
