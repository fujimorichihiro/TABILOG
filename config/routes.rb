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
      get :follwer, :followed
    end
  end
  
  resources :articles do
    resources :comment, only: [:create, :destroy]
    resource :favolites, only: [:create, :destroy]
  end

  resources :relationships, only: [:create, :destroy]
  resources :postimages, only: [:index]
  resources :rooms, only: [:show]
  resources :messages, only: [:create, :destroy]
end
