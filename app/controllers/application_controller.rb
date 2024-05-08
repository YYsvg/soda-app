# frozen_string_literal: true, if: :devise_controller?

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?



  def authenticate
    redirect_to new_user_registration_url unless user_signed_in?
  end

  private
    # ログイン後のリダイレクト先
    def after_sign_in_path_for(resource_or_scope)
      if current_user.role == true
        admin_root_path
        # homes_path
      else
        # admin_root_path
        homes_path
      end
    end

    # ログアウト後のリダイレクト先
    def after_sign_out_path_for(resource_or_scope)
      new_user_registration_path
    end

    def configure_permitted_parameters
      # 管理者用のカラムを許可
      devise_parameter_sanitizer.permit(
        :sign_up, keys: [:role, :name, :email, :password, :password_confirmation])
      devise_parameter_sanitizer.permit(
        :sign_in, keys: [:role, :name, :email, :password, :password_confirmation])
      devise_parameter_sanitizer.permit(
        :account_update, keys: [:role, :name, :email, :password, :password_confirmation])
    end
  end
