Rails.application.routes.draw do
  resources :univercities, only: [:index, :show, :create]
  resources :teams,        only: [:index, :show, :create]
  resources :demos
  get 'demos/index'
  get 'demos/show'
  get 'teams/index'
  get 'teams/show'
  get 'univercities/index'
  get 'univercities/show'
  get 'posts/index' => 'posts#index'
  get 'posts/new' => 'posts#new'
  get 'posts/:id' => 'posts#show'
  post 'posts/create' => 'posts#create'
  post 'posts/:id/update' => 'posts#update'
  post 'posts/:id/destroy' => 'posts#destroy'
  get 'posts/:id/edit' => 'posts#edit'
  # get '/' =>'home#top'
  root 'home#top'
  get '/about' => 'home#about'
  get 'user/signup' => "user#new"
  
  get '/login' => "user#login_form"
  
  post '/login' => 'user#login'
  post '/logout' => 'user#logout'
  
  get 'user/index' => 'user#index'
  get 'user/:id/' => 'user#show'
  get 'user/:id/edit' => 'user#edit'
  post 'user/create' => 'user#create'
  post 'user/:id/update' => 'user#update'
  post 'user/:id/destroy' => 'user#destroy'
  # post 'univercities/create' => 'univercities#create'

  
end
