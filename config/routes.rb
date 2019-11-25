Rails.application.routes.draw do
  devise_for :admins, path: 'admins', controllers: {
    sessions:           "admins/sessions",
    passwords:          "admins/passwords",
    registrations:      "admins/registrations",
    confirmations:      "admins/confirmations"
    # omniauth_callbacks: "users/omniauth_callbacks"
  }
  devise_for :users, path: 'users', controllers: {
    sessions:           "users/sessions",
    passwords:          "users/passwords",
    registrations:      "users/registrations",
    confirmations:      "users/confirmations"
    # omniauth_callbacks: "users/omniauth_callbacks"
  }
  root to: 'pages#home'
  get 'export_users' => 'users#export_user'
  post 'import_users' => 'users#import_user', as: 'import_users'
  resources :users, only: [:new, :create, :show, :index, :destroy]
  resources :pages
  resources :groups 
  resources :groups_users
  post 'import_groups_users' => 'groups_users#import_groups_users', as: 'import_groups_users'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
