class HomesController < ApplicationController
  def index
    @income = Income.new
    @outcome = Outcome.new
    @want = Want.new
    
    @income_category = IncomeCategory.new
    @outcome_category = OutcomeCategory.new

    @incomename = "収入"
    @outcomename = "支出"

    @income_categories = IncomeCategory.all
    @outcome_categories = OutcomeCategory.all

  end
end
