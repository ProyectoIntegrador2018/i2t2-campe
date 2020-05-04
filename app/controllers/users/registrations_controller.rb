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

  def new_with_former_student
    authorize User
    @user = User.new
    @user.role = "former_student"
  end

  def new_with_company
    authorize User
    @user = User.new
    @user.role = "company"
  end

  def sign_up(resource_name, resource)
    true
  end

  private
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:email,
               :password,
               :password_confirmation,
               :role,
               company_attributes: [:name, :information],
               student_attributes: [:email,
                                    :desc_request_status,
                                    :cvu,
                                    :name,
                                    :paternal_last_name,
                                    :maternal_last_name,
                                    :rfc,
                                    :birth_date,
                                    :curp,
                                    :gender,
                                    :marital_status,
                                    :country_birth,
                                    :state_birth,
                                    {contact_information_attributes: [:street_address,
                                                                      :street_number_address_ext,
                                                                      :street_number_address_int,
                                                                      :neighborhood,
                                                                      :city,
                                                                      :municipality,
                                                                      :state,
                                                                      :phone_number,
                                                                      :cellphone_number,
                                                                      :student_id]},
                                    {scholarships_attributes: [:scholarship_oportunity_id,
                                                               :fiscal_year,
                                                               :studies_start,
                                                               :studies_end,
                                                               :start,
                                                               :end,
                                                               :institution,
                                                               :entity,
                                                               :desired_support,
                                                               :program,
                                                               :study_field,
                                                               :study_area,
                                                               :discipline,
                                                               :sub_discipline,
                                                               :degree_level,
                                                               :most_recent_gpa]}])
    end
  end
end
