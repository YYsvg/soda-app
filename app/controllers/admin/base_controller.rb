class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin
  # before_action :configure_permitted_parameters, if: :devise_controller?
  layout "admin"


  private

  def check_admin
    unless current_user&.admin?
      redirect_to homes_path, alert: '権限がありません。'
    end
  end
end
