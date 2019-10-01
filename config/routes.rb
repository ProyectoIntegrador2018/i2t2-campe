Rails.application.routes.draw do
  devise_for :admins, path: 'admins', controllers: {
    sessions:           "admins/sessions",
    passwords:          "admins/passwords",
    registrations:      "admins/registrations",
    confirmations:      "admins/confirmations"
    # omniauth_callbacks: "users/omniauth_callbacks"
  }
  root to: 'pages#home'
  devise_for :users, path: 'users', controllers: {
    sessions:           "users/sessions",
    passwords:          "users/passwords",
    registrations:      "users/registrations",
    confirmations:      "users/confirmations"
    # omniauth_callbacks: "users/omniauth_callbacks"
      }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
