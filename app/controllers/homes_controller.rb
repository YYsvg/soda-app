class HomesController < ApplicationController
  def index
    @income = Income.new
    @outcome = Outcome.new
    @income_category = IncomeCategory.new
    @outcome_category = OutcomeCategory.new

    @incomename = "収入"
    @outcomename = "支出"
  end
end
