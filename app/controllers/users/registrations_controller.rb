# frozen_string_literal: true

# Registration controller to register a single student.
class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_action :require_no_authentication, only: [:new, :create]

  before_action :configure_sign_up_params, only: [:create]
  before_action :authenticate_user!, :redirect_unless_admin,  only: [:new, :create]

  def create
    super
    #@groups_user = GroupsUser.new()
    #@groups_user.user_id = User.last.id
    #@groups_user.group_id = params[:group_id].to_i
    #@groups_user.save
  end

  def new_with_student
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
                                     :country_birth, :state_birth])
    end
  end

  def redirect_unless_admin
    unless current_user.try(:super_admin?)
      flash[:error] = "Only admins can do that"
      redirect_to root_path
    end
  end
end
