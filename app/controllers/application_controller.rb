class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  # ログイン後のリダイレクト先
  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admins_home_top_path
    when User
      user_path(current_user)
    end
  end

  #ログアウト後のリダイレクト先
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      new_admin_session_path
    else
      root_path
    end
  end

  # 多言語化用メソッド、rails ガイド参照
  # paramsからlocaleを取得する
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  #books_pathやbooks_urlなどのリンクで自動的にロケール情報が含まれるように設定。
  def default_url_options
    { locale: I18n.locale }
  end

  protected
  def configure_permitted_parameters
    #strong parametersを設定し、nameを許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation])
  end
end
