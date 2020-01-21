Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'home#home'

  resources :assets

  get '/register', to: 'users#new'
  post '/register', to: 'users#create'
  get '/dashboard', to: 'users#show'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/myassets', to: 'user_assets#index'
  get 'myassets/add', to: 'user_assets#new'
  get '/myassets/:id', to: 'user_assets#show'
  post '/myassets', to: 'user_assets#create'

  get 'myassets/:id/trade', to: 'trades#new'
  post 'myassets/:id/trade', to: 'trades#create'
end
