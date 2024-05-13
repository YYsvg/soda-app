class IncomesController < ApplicationController
  before_action :authenticate
  
  def index
    @incomes = current_user.incomes.all
    @income_categories = IncomeCategory.all
  end

  def new
    @income = current_user.income.new
    @income_categories = IncomeCategory.all
  end

  def create
    @income = current_user.incomes.new(income_params)
    @income.save
    redirect_to @income
  end

  def show
    @income = Income.find(params[:id])
    @user = @income.user
  end

  def destroy
    @income = Income.find(params[:id])
    @income.destroy
    redirect_to incomes_path, notice:"削除しますか？"
  end

  def edit
    @income = Income.find(params[:id])
  end
  
  def update
    @income = Income.find(params[:id])
    if @income.update(income_params)
      redirect_to incomes_path, notice: "編集しますか？"
    else
      render 'edit'
    end
  end

  private

  def income_params
    params.require(:income).permit(:memo,:price,:image,:income_category_id,:user_id)
  end
end
