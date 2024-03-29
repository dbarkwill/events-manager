Rails.application.routes.draw do
  # mount ActionCable.server, at: '/cable'
  root 'customers#lookup'

  get 'lookup', to: 'customers#lookup'
  get 'customers/export_attendance', to: 'customers#export_attendance'
  get 'admin', to: 'static_pages#admin'
  get 'dashboard', to: 'static_pages#dashboard'
  get 'setup', to: 'static_pages#setup'

  resources :employees
  resources :customers do
    collection do
      post :import
      post :import_reg
      get :rsvp
      get :checked_in
    end
  end
  get 'reset/check_ins', to: 'actions#reset_check_ins'
  get 'reset/registrations', to: 'actions#reset_registrations'
  get 'reset/database', to: 'actions#reset_database'

  resources :sessions, only: [:new, :create, :destroy]

  resources :settings

  get 'login', to: 'static_pages#home'
  get 'logout', to: 'sessions#destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
