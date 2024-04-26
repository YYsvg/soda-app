class OutcomesController < ApplicationController
  def index
    @outcomes = Outcome.all
    @outcome_categories = OutcomeCategory.all
    @outcome_category_names = OutcomeCategory.category_names
  end

  def show
    @outcome = Outcome.find(params[:id])
  end

  def new
    @outcome = Outcome.new
    @outcome_categories = OutcomeCategory.all
  end

  def create
    @outcome = Outcome.new(outcome_params)
    @outcome.save
    redirect_to @outcome
  end

  private

  def outcome_params
    params.require(:outcome).permit(:memo,:price,:outcome_category,:outcome_category_id)
  end
end
