class HomesController < ApplicationController
  before_action :authenticate
  
  def index

    @users = User.all

    @income_categories = IncomeCategory.all
    @outcome_categories = OutcomeCategory.all

    @income = Income.new
    @outcome = Outcome.new
    @want = Want.new

    @income_category = IncomeCategory.new
    @outcome_category = OutcomeCategory.new

    @incomename = "収入"
    @outcomename = "支出"

  end
end
