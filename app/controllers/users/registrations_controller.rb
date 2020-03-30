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

  def sign_up(resource_name, resource)
    true
  end

  private
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:role,
                                             :email,
                                             :desc_request_status,
                                             :cvu, :name, :paternal_last_name,
                                             :maternal_last_name,
                                             :rfc, :birth_date, :curp,
                                             :gender, :marital_stauts,
                                             :country_birth, :state_birth,
                                             :street_address,
                                             :street_number_address_ext,
                                             :street_number_address_int,
                                             :colony_address, :city_address,
                                             :municipiality_address,
                                             :state_address, :phone_number,
                                             :cell_phone, :convocatory,
                                             :fiscal_year, :studies_start_date,
                                             :studies_end_date,
                                             :start_scholarship,
                                             :end_scholarship, :school, :entity,
                                             :support_to_get, :program,
                                             :expertise_area, :field_study,
                                             :discipline, :sub_discipline,
                                             :last_gpa])
  end

  def redirect_unless_admin
    unless current_user.try(:super_admin?)
      flash[:error] = "Only admins can do that"
      redirect_to root_path
    end
  end
end
