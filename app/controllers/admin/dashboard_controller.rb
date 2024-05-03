class Admin::DashboardController < Admin::BaseController
  def index
    @users = User.all
    @roles = User.user_roles
  end
end

