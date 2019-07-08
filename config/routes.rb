Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :users 
  resources :shows
  resources :reviews
  

  get '/custom_query', to: 'reviews#custom_query'
  root to: 'application#welcome'
end
