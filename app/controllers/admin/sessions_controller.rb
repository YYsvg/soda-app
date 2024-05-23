# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  before_action :configure_permitted_parameters, only: [:new,:create,:destroy]

  # layout 'admin'

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  # def destroy
    # super
  # end

  protected
  
  # ログイン後のリダイレクト先を設定
  def after_sign_in_path_for(resource_or_scope)
    admin_root_url
  end

  def after_sign_out_path_for(resource)
    admin_login_path
  end

end
