Rails.application.routes.draw do
  devise_for :users, path: 'users', controllers: {
    sessions:           "users/sessions",
    passwords:          "users/passwords",
    registrations:      "users/registrations",
    confirmations:      "users/confirmations"
  }

  devise_scope :user do
    get "users/new_with_student" => "users/registrations#new_with_student", :as => "new_with_student"
  end

  root to: 'pages#home'
  get 'export_users' => 'users#export_user'
  post 'import_users' => 'users#import_user', as: 'import_users'
  resources :students
  resources :pages
  resources :groups 
  resources :groups_users
  post 'import_groups_users' => 'groups_users#import_groups_users', as: 'import_groups_users'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
