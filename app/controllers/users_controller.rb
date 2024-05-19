class UsersController < ApplicationController
  # before_action :authenticate_admin!
  before_action :authenticate
  before_action :set_user

  def mypage

    # 収入の総計
    @income_total = current_user.incomes.sum(:price)
    @outcome_total = current_user.outcomes.sum(:price)
    @balance = @income_total - @outcome_total

    # 年、月の取得
    @year = Date.today.year
    @month = Date.today.month

    # 月毎の収支
    @monthly_incomes = (1..12).map do |month|
      start_date = Date.new(@year, month, 1)
      end_date = start_date.end_of_month
      {
        month: start_date.strftime("%-m月"),
        incomes: current_user.incomes.where(created_at: start_date..end_date).sum(:price)
      }
    end

    @monthly_outcomes = (1..12).map do |month|
      start_date = Date.new(@year, month, 1)
      end_date = start_date.end_of_month
      category_outcomes = {}

      OutcomeCategory.all.each do |outcome_category|
        category_outcome_price = current_user.outcomes.where(created_at: start_date..end_date, outcome_category_id: outcome_category.id).sum(:price)
        category_outcomes[outcome_category.name] = category_outcome_price
      end
        {
          month: start_date.strftime("%-m月"),
          total_outcomes: current_user.outcomes.where(created_at: start_date..end_date).sum(:price),
          category_outcomes: category_outcomes
        }
    end


    # 当月の収支
    current_month_income = @monthly_incomes.find { |income| income[:month] == Date.current.strftime("%-m月") }
    @current_month_income_value = current_month_income[:incomes]

    current_month_outcome = @monthly_outcomes.find { |outcome| outcome[:month] == Date.current.strftime("%-m月") }
    @current_month_outcome_value = current_month_outcome[:total_outcomes]
    @current_month_outcome_name = current_month_outcome[:total_outcomes]

    # 年間収支
    @yearly_incomes_total  = @monthly_incomes.sum { |income| income[:incomes] }
    @yearly_outcomes_total = @monthly_outcomes.sum { |outcome| outcome[:total_outcomes] }
    @yearly_balance = @yearly_incomes_total - @yearly_outcomes_total
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    @user = @user.update(user_params)
    redirect_to homes_path
  end

  private
  def set_user
    @user = current_user
  end

  def user_params
    params.permit(:name)
  end

end