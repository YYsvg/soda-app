class HomesController < ApplicationController
  before_action :authenticate
  
  def index

    # @income_categories = current_user.income_categories(:income_category_id)
    @income_categories = IncomeCategory.all
    @outcome_categories = OutcomeCategory.all

    @income = Income.new
    @outcome = Outcome.new

    @income_category = IncomeCategory.new
    @outcome_category = OutcomeCategory.new

    @incomename = "収入"
    @outcomename = "支出"

  end
end
