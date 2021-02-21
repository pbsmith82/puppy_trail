Rails.application.routes.draw do
  get '/dogs/needs_walked' => 'dogs#needs_walked'
  get '/dogs/by_breeds' => 'dogs#by_breeds'
 
  resources :dogs do 
    resources :walks, only: [:index, :new, :create]
  end
  
  resources :users
  resources :walks

  get '/walks/:id/delete' => 'walks#destroy'
  get '/dogs/:id/delete' => 'dogs#destroy'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/logout' => 'sessions#destroy'
  match '/auth/github/callback', to: 'users#omniauth', via: [:get, :post]

  root 'welcomes#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
