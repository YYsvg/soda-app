class IncomeCategoriesController < ApplicationController
  before_action :authenticate
  
  def index
    @income_categories = IncomeCategory.all
  end

  def new
    @income_category = IncomeCategory.new
  end

  def create
    @income_category = IncomeCategory.new(category_params)
    @income_category.save
    redirect_to @income_category
  end

  def show
    @income_category = IncomeCategory.find(params[:id])
  end

  def edit
    @income_category = IncomeCategory.find(params[:id])
  end

  def update
    @income_category = IncomeCategory.find(params[:id])
    @income_category = @income_category.update(category_params)
    redirect_to income_categories_path
  end

  def destroy
    @income_category = IncomeCategory.find(params[:id])
    @income_category.destroy
    redirect_to income_categories_path, notice: "削除しました"
  end

  private
    
  def category_params
    params.require(:income_category).permit(:name,:image)
  end


  end
