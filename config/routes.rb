Rails.application.routes.draw do
  mount ActionCable.server, at: '/cable'
  root 'customers#lookup'

  get 'lookup', to: 'customers#lookup'
  get 'customers/export_attendance', to: 'customers#export_attendance'
  get 'admin', to: 'static_pages#admin'

  resources :employees
  resources :customers do
    collection { post :import }
  end

  resources :sessions, only: [:new, :create, :destroy]

  get 'login', to: 'static_pages#home'
  get 'logout', to: 'sessions#destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
