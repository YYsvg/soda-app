class UsersController < ApplicationController
  # before_action :authenticate_admin!
  before_action :authenticate
  before_action :set_user

  def mypage

    @income_total = current_user.incomes.sum(:price)
    @outcome_total = current_user.outcomes.sum(:price)
    @balance = @income_total - @outcome_total


    @monthly_incomes = (1..12).map do |month|
      {
       month: "#{month}月",
       incomes: current_user.incomes.where(created_at: Date.new(2024, month, 1).all_month).sum(:price)
     }
     end

    @monthly_outcomes = (1..12).map do |month|
      {
       month: "#{month}月",
       outcomes: current_user.outcomes.where(created_at: Date.new(2024, month, 1).all_month).sum(:price)
     }
     end
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    @user = @user.update(user_params)
    redirect_to mypage_users_path
  end

  private
  def set_user
    @user = current_user
  end

  def user_params
    params.permit(:name)
  end

end