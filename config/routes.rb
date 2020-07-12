Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, except: [:index]
  resources :garden_beds do
    resources :plants, only: [:index, :show]
  end
  resources :plants, only: [:index, :show]
  resources :plantings, only: [:create, :update, :destroy]
  
  root to: 'sessions#home'

  get "/auth/google_oauth2/callback", to: 'sessions#g_log_in'
end
