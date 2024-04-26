class IncomesController < ApplicationController
  def index
    @incomes = Income.all
    @income_categories = IncomeCategory.all
    @income_category_names = IncomeCategory.category_names
  end

  def show
    @income = Income.find(params[:id])
    @user = @income.user
  end

  def new
    @income = Income.new
    @income_categories = IncomeCategory.all
  end

  def create
    @income = Income.new(income_params)
    @income.save
    redirect_to @income
  end

  def edit
    @income = Income.find(params[:id])
  end


  private

  def income_params
    params.require(:income).permit(:memo,:price,:image,:income_category_id,:user_id)
  end
end
