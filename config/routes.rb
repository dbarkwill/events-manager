Rails.application.routes.draw do
  root 'customers#lookup'

  get 'lookup', to: 'customers#lookup'
  get 'customers/export_attendance', to: 'customers#export_attendance'
  get 'admin', to: 'static_pages#admin'

  resources :check_ins
  resources :employees
  resources :registrations
  resources :customers do
    resources :registrations
    collection { post :import }
  end

  resources :sessions, only: [:new, :create, :destroy]

  get 'login', to: 'static_pages#home'
  get 'logout', to: 'sessions#destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
