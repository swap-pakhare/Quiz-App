Rails.application.routes.draw do
  root 'static_pages#home'

  get 'static_pages/about'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/dashboard', to: 'users#home'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/admin/users', to: 'admins#showusers'
  get '/admin/addadmin', to: 'admins#new'
  post 'admin/addadmin', to: 'admins#create'
  get 'admin/dashboard', to: 'admins#home'
  get 'admin/display', to: 'admins#display'
  delete 'admin/admins', to: 'admins#destroy'
  delete 'admin/users', to: 'users#destroy'

  get '/quiz', to: 'games#new'
  get '/quest/:id1/:id2', to: 'games#quest'
  post '/quest/:id1/:id2', to: 'games#updatequest'
  post '/updategame', to: 'games#update'

  resources :users
  resources :admins

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
