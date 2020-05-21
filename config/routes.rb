Rails.application.routes.draw do
  resources :job_applications
  resources :companies
  resources :job_postings
  devise_for :users, path: 'users', controllers: {
    sessions:           "users/sessions",
    passwords:          "users/passwords",
    registrations:      "users/registrations",
    confirmations:      "users/confirmations"
  }

  devise_scope :user do
    get "users/new_with_student" => "users/registrations#new_with_student", :as => "new_with_student"
    get "users/new_with_company" => "users/registrations#new_with_company", :as => "new_with_company"
    get "users/new_with_former_student" => "users/registrations#new_with_former_student", :as => "new_with_former_student"
  end

  root to: 'pages#home'
  get 'export_users' => 'users#export_user'
  post 'import_users' => 'users#import_user', as: 'import_users'
  resources :students do
    get 'history', on: :member
  end
  get 'former_students' => 'students#former_students', as: 'former_students'
  get 'former_students_upload' => 'students#former_students_upload', as: 'former_students_upload'
  post 'import_former_students' => 'students#import_former_students', as: 'import_former_students'
  get 'first_time_login' => 'students#first_time_login', as: 'first_time_login'
  resources :curriculums, except: [:index, :destroy]
  resources :pages
  resources :scholarships
  resources :scholarship_oportunities
  post 'import_scholarships' => 'scholarships#import_scholarships', as: 'import_scholarships'
end
