class UsersController < ApplicationController
  before_action :authenticate
  
  def show
    @user = User.find(params[:id])
    @incomes = @user.incomes
  end
end
