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
    # @outcome = current_user.outcomes.build(outcome_params) 
    # 変更後（new も使えるらしい。が、慣習的にbuildを使うらしい）
    # @report = current_user.reports.new(report_params) 
    @outcome.save
    redirect_to @outcome
  end

  private

  def outcome_params
    params.require(:outcome).permit(:memo,:price,:image,:outcome_category_id,:user_id)
  end
end
