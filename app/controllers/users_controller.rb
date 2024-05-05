class UsersController < ApplicationController
  before_action :authenticate
  before_action :set_user
  
  def index

  
  end

  def show
    @user = User.find(params[:id])
    @incomes = @user.incomes
  end

  def update
    @user.update_without_password(user_params)
    redirect_to  mypage_users_url
  end

  def mypage
    @incomes = Income.all
    @outcomes = Outcome.all
    # @income = Income.find(params[:id])
    @users = User.all
    @income_total = Income.group(:user_id).sum(:price)
    @outcome_total = Outcome.group(:user_id).sum(:price)
    @balance = 0
    # amount = @income_total - @outcome_total
  end

  def edit
  end

  private
  def set_user
    @user = current_user
  end

  def user_params
    params.permit(:name)
  end

end



