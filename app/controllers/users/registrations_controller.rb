# frozen_string_literal: true

# Registration controller to register a single student.
class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_action :require_no_authentication, only: [:new, :create]

  before_action :configure_sign_up_params, only: [:create]

  def create
    authorize User
    super
  end

  def new
    authorize User
    super
  end

  def new_with_student
    authorize User
    @user = User.new
  end

  def sign_up(resource_name, resource)
    true
  end

  private
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:email, :password, :password_confirmation, :role,
               student_attributes: [:email,
                                    :desc_request_status,
                                    :cvu, :name, :paternal_last_name,
                                    :maternal_last_name,
                                    :rfc, :birth_date, :curp,
                                    :gender, :marital_status,
                                    :country_birth, :state_birth,
                                    contact_information_attributes: [:phone_number, :cell_phone_number]])
    end
  end
end
