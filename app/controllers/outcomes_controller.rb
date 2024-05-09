class OutcomesController < ApplicationController
  before_action :authenticate
  
  def index
    @outcomes = Outcome.all
    @outcome_categories = OutcomeCategory.all
    @outcome_category_names = OutcomeCategory.category_names
  end

  def new
    @outcome = current_user.outcome.new
    @outcome_categories = OutcomeCategory.all
  end

  def create
    @outcome = current_user.outcomes.new(outcome_params)
    @outcome.save
    redirect_to @outcome
  end

  def show
    @outcome = Outcome.find(params[:id])
  end

  def destroy
    @outcome = Outcome.find(params[:id])
    @outcome.destroy
    redirect_to outcomes_path, notice:"削除しますか？"
  end

  def edit
    @outcome = Outcome.find(params[:id])
  end

  def update
    @outcome = Outcome.find(params[:id])
    if @outcome.update(outcome_params)
      redirect_to outcomes_path, notice: "編集しました"
    else
      render'edit'
    end
  end

  private

  def outcome_params
    params.require(:outcome).permit(:memo,:price,:image,:outcome_category_id,:user_id)
  end
end
