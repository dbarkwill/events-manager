Rails.application.routes.draw do
  get 'static_pages/admin'
  root 'static_pages#home'

  get 'lookup', to: 'customers#lookup'

  resources :check_ins
  resources :employees
  resources :registrations
  resources :customers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
