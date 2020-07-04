Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  
  root to: 'sessions#home'

  get "/auth/google_oauth2/callback", to: 'sessions#logged_in'
end
