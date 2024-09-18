Rails.application.routes.draw do
  root "home#index"
  get "about", to: "home#about", as: :about
  get "users", to: "home#users", as: :users
  post "change_lock", to: "home#change_lock", as: :change_lock
  devise_for :users, controllers: {
    registration: "users/registrations",
    sessions: "users/sessions",
    password: "users/passwords",
    confirmation: "users/confirmations"
  }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
