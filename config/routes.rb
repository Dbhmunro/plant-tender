Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, except: [:index]

  resources :sessions, only: [:new, :create, :destroy]
  
  root to: 'sessions#home'

  get "/auth/google_oauth2/callback", to: 'sessions#g_log_in'
end
