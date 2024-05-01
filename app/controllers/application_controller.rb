class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


def authenticate
  redirect_to new_user_registration_url unless user_signed_in?
end

private
  # ログイン後のリダイレクト先
  def after_sign_in_path_for(resource_or_scope)
    root_path
  end

  # ログアウト後のリダイレクト先
  def after_sign_out_path_for(resource_or_scope)
    new_user_registration_path
  end

  def configure_permitted_parameters
    # 管理者用のカラムを許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
    devise_parameter_sanitizer.permit(:account_update, keys: [:role])
  end


end
