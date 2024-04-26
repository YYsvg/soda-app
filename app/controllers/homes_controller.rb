class HomesController < ApplicationController
  def index
    @income = Income.new
    @outcome = Outcome.new

    @incomename = "収入"
    @outcomename = "支出"
  end
end
