class UsersController < ApplicationController
  # before_action :authenticate_admin!
  before_action :authenticate
  before_action :set_user

  def mypage
    @users = User.all
    @incomes = Income.all
    @outcomes = Outcome.all

    @income_total = Income.group(:user_id).sum(:price)
    
    @income_month = Income.group("strftime('%Y-%m', created_at)").count
    # @income_month = Income.group("strftime('%Y-%m', created_at)").pluck("strftime('%Y-%m', created_at)", :created_at)


    @income_totals_by_month = Income.group("strftime('%Y-%m', created_at), user_id").sum(:price)
    

    # monthly_total = income_total.all_month
    # @user = User.find(params[:id])
    # @income = Income.find(params[:id])

    # @monthly_tolal = @daily_records.where(date: @income.all_month).sum(:price)
    @monthly_totals = Income.all.group_by { |income| income.created_at.beginning_of_month }.transform_values { |incomes| incomes.sum(&:price) }

    # 年ごとの合計を計算
    @yearly_totals = Income.all.group_by { |income| income.created_at.beginning_of_year }.transform_values { |incomes| incomes.sum(&:price) }
    @outcome_total = Outcome.group(:user_id).sum(:price)
    @balance = 0
    # amount = @income_total - @outcome_total
    @total = Income.sum(:price)

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