Rails.application.routes.draw do
  root 'static_pages#home'

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

  get 'logout', to: 'sessions#destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
