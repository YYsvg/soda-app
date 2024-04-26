class OutcomeCategory < ApplicationRecord
  has_many :outcomes

  scope :category_names, -> { pluck(:name).uniq }
end
