Rails.application.routes.draw do

  namespace :admin do
    root :to => "base#index" #admin_root_path
    resources :users
  end

  root "projects#index"

  resources :projects do
  	resources :tickets
  end

  resources :users

  get   "/signin", to: "sessions#new"
  post "/signin" , to: "sessions#create"

end	
