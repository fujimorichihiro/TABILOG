Rails.application.routes.draw do

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
  root 'home#top'

  resources :users, only: [:show, :edit, :update] do
    member do
      get :following, :follower
    end
  end
  
  resources :articles do
    resources :comments, only: [:create, :destroy]
    resource :favolites, only: [:create, :destroy]
  end

  resource :relationships, only: [:create, :destroy]
  resources :postimages, only: [:index]
  resources :rooms, only: [:show, :create]
  resources :messages, only: [:create, :destroy]
  resources :uploads, only: [:create, :destroy]

# 管理者側----------------------------------------------
  namespace :admins do
    get 'home/top'

    resources :users, only: [:show, :index, :edit, :update]
  end
#-------------------------------------------------------

end
