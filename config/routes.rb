Cataloger::Application.routes.draw do
  
  resources :categories

  root :to => 'catalogs#index'
  
  match 'login' => 'user_sessions#new', :via => :get
  match 'logout' => 'user_sessions#destroy', :via => [:get, :delete]
  match 'signup' => 'users#new'
  
  resource :user_session, :only => [:new, :create, :destroy]
  resource :account, :controller => 'users', :except => [:index, :destroy]
  
  resources :catalogs do
    resources :products
  end
  
end
