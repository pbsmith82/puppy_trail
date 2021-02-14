Rails.application.routes.draw do
 resources :dogs do 
  resources :walks, only: [:index, :new]
 end
 resources :users
 resources :walks

 get '/login' => 'sessions#new'

 root 'welcome#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
