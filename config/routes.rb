Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "about", to: "pages#about"
  
  get "signup", to: "users#new"
  resources :users, except: [:new]
  resources :categories
  
  resources :articles
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # Defines the root path route ("/")
  root "pages#home"
end
