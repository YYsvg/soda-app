class IncomeCategory < ApplicationRecord
  has_many :incomes

  scope :category_names, -> { pluck(:name).uniq }
end
