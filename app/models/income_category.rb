class IncomeCategory < ApplicationRecord
  has_many :incomes,   dependent: :destroy

  scope :category_names, -> { pluck(:name).uniq }
end
