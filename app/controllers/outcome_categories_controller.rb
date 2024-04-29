class OutcomeCategoriesController < ApplicationController
  def index
    @outcome_categories = OutcomeCategory.all
  end

  def new
    @outcome_category = OutcomeCategory.new
  end

  def create
    @outcome_category = OutcomeCategory.new(category_params)
    @outcome_category.save
    redirect_to @outcome_category
  end

  def show
    @outcome_category = OutcomeCategory.find(params[:id])
  end

  def edit
    @outcome_category = OutcomeCategory.find(params[:id])
  end
  
  def update
    @outcome_category = OutcomeCategory.find(params[:id])
    @outcome_category = @outcome_category.update(category_params)
    redirect_to outcome_categories_path
  end

  def destroy
    @outcome_category = OutcomeCategory.find(params[:id])
    @outcome_category.destroy
    redirect_to outcome_categories_path, notice: "削除しました"
  end

  private

  def category_params
    params.require(:outcome_category).permit(:name,:image)
  end
end
