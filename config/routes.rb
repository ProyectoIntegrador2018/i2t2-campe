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
  resources :scholarships
  resources :scholarship_oportunities
  post 'import_scholarships' => 'scholarships#import_scholarships', as: 'import_scholarships'
end
