Rails.application.routes.draw do

  root :to => 'publics#index'

  get 'show/:permalink', :to => 'publics#show', :as => 'public_show'

  get 'admin', :to => 'access#menu' # To access menu, user must be logged in
  get 'access/menu'
  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'

  resources :admin_users, :except => [:show] do
    member do
      get :delete
    end
  end

  resources :subjects do
    member do
      get :delete
    end
  end
  
  resources :pages do
    member do
      get :delete
    end
  end

  resources :sections do
    member do
      get :delete
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
