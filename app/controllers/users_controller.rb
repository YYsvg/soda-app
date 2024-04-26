class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @incomes = @user.incomes
  end
end
