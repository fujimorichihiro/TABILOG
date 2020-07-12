class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
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

  # 404,500エラー時のviewの表示
  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  rescue_from ActionController::RoutingError, with: :render_404
  rescue_from Exception, with: :render_500

  def render_404(exception = nil)
    if exception
      logger.info "Rendering 404 with exception: #{exception.message}"
    end
    render template: "errors/error_404", status: 404, layout: 'application'
  end

  def render_500(exception = nil)
    if exception
      logger.info "Rendering 500 with exception: #{exception.message}"
    end
    render template: "errors/error_500", status: 500, layout: 'application'
  end

  protected
  def configure_permitted_parameters
    #strong parametersを設定し、nameを許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation])
  end
end
