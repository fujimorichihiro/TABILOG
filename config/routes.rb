Rails.application.routes.draw do

  # ロケールの指定がなければデフォルトのロケールを使用する。
  # http://localhost:3000/en/articlesのように指定する。
  scope "(:locale)", locale: /ja|en/ do
  # devise------------------------------------------
    devise_for :admins, controllers: {
      sessions:      'admins/sessions',
      passwords:     'admins/passwords',
      registrations: 'admins/registrations'
    }

    devise_for :users, controllers: {
      sessions:      'users/sessions',
      passwords:     'users/passwords',
      registrations: 'users/registrations'
    }
  #------------------------------------------------

  #root path
    get '/:locale' => 'home#top'
    root 'home#top'

    resources :users, only: [:show, :edit, :update] do
      member do
        get :following, :follower, :favolite, :timeline
      end
    end

    resources :articles do
      resources :comments, only: [:create, :destroy]
      resource :favolites, only: [:create, :destroy]
    end

    resource :relationships, only: [:create, :destroy]
    resources :postimages, only: [:index]
    resources :rooms, only: [:show, :create, :index]
    resources :messages, only: [:create, :destroy]
    resources :uploads, only: [:create, :destroy]
    resources :inquiries, only: [:new, :create]

  # 管理者側----------------------------------------------
    namespace :admins do
      get 'home/top'

      resources :users, only: [:show, :index, :edit, :update]
      resources :inquiries, only: [:show, :index]
    end
#-------------------------------------------------------
  end
end
