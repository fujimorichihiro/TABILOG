# refileが404Errorとして拾われないようにする制限(railsガイド、ルーティング3.10)
class ErrorAvoid
  def initialize
    @url = "attachments/"
  end

  def matches?(request)
    @url.include?(request.url)
  end
end

Rails.application.routes.draw do

  devise_for :users, skip: [ :session, :password, :registratioin, :confirmatioin ],
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  post '/language' => 'locales#change_locale'

  # ロケールの指定がなければデフォルトのロケールを使用する。
  # http://localhost:3000/en/articlesのように指定する。
  scope "(:locale)", locale: /ja|en/ do
  # devise------------------------------------------
    devise_for :admins, controllers: {
      sessions:      'admins/sessions',
      passwords:     'admins/passwords',
      registrations: 'admins/registrations'
    }

    get 'omniauth/:provider' => 'users/omniauth#localized', as: :localized_omniauth
    devise_for :users,
    skip: :omniauth_callbacks,
    controllers: {
      sessions:      'users/sessions',
      passwords:     'users/passwords',
      registrations: 'users/registrations',
      confirmations: 'users/confirmations',
      omniauth_callbacks: 'users/omniauth_callbacks'
    }
  #------------------------------------------------

  #root path
    get '/:locale' => 'home#top'
    root 'home#top'
    get 'map' => 'home#map'
    get 'home' => 'home#home'

    resources :users, only: [:show, :edit, :update] do
      member do
        get :following, :follower, :favolite, :timeline, :notifications, :stock, :gallery
      end
    end

    resources :articles do
      resources :comments, only: [:create, :destroy]
      resource :favolites, only: [:create, :destroy]
      resource :stocks, only: [:create, :destroy]
      collection do
        get :spot_search
      end
    end

    resource :relationships, only: [:create, :destroy]
    resources :postimages, only: [:index]
    resources :rooms, only: [:show, :create, :index]
    resources :messages, only: [:create, :destroy]
    resources :uploads, only: [:create, :destroy]
    resources :inquiries, only: [:new, :create]
    resources :photos, only: [:new, :show, :create]

  # 管理者側----------------------------------------------
    namespace :admins do
      get 'home/top'

      resources :users, only: [:show, :index, :edit, :update]
      resources :inquiries, only: [:show, :index, :update]
    end
#-------------------------------------------------------
  end
  

  #API用
  namespace :api, { format: 'json' } do
    namespace :v1 do
      resources :articles
    end
  end

  get '*path', to: 'application#render_404',
    constraints: ErrorAvoid.new
end


