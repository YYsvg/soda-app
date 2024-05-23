# frozen_string_literal: true, if: :devise_controller?

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def authenticate
    # 登録していないユーザーはログイン画面に戻る
    redirect_to new_user_session_url unless user_signed_in?
  end

  protected
    # 管理者ログイン後のリダイレクト先
    def after_sign_in_path_for(resource_or_scope)
      if current_user.role == true
        admin_root_path
      else
        homes_path
      end
    end

    # ログアウト後のリダイレクト先
    def after_sign_out_path_for(resource_or_scope)
      # ログイン画面へ遷移
      new_user_session_url
    end

    def configure_permitted_parameters
      # 管理者登録時に許可するパラメータを設定
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :role])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:name, :email, :role])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :role])
    end
  end
