Cataloger::Application.routes.draw do
  
  root :to => 'users#show'
  
  match 'login' => 'user_sessions#new', :via => :get
  match 'logout' => 'user_sessions#destroy', :via => [:get, :delete]
  match 'signup' => 'users#new'
  
  resource :user_session, :only => [:new, :create, :destroy]
  resource :account, :controller => 'users', :except => [:index, :destroy]
  
  resources :catalogs
  
end
