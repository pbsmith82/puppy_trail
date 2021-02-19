Rails.application.routes.draw do
 resources :dogs do 
  resources :walks, only: [:index, :new, :create]
 end
 resources :users
 resources :walks

 get '/dogs/needs_walked' => 'dogs#needs_walked'
 get '/login' => 'sessions#new'
 post '/login' => 'sessions#create'
 get '/signup' => 'users#new'
 post '/signup' => 'users#create'
 get '/logout' => 'sessions#destroy'
 match '/auth/github/callback', to: 'sessions#omniauth', via: [:get, :post]

 root 'welcome#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
