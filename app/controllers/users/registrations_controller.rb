# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:email, :desc_request_status, :cvu,
                                               :name, :paternal_last_name, :maternal_last_name, :rfc,
                                               :curp, :gender, :marital_stauts, :country_birth, :state_birth,
                                               :street_address, :street_number_address_ext, :street_number_address_int,
                                               :colony_address, :city_address, :municipiality_address, :state_address,
                                               :phone_number, :cell_phone, :convocatory, :fiscal_year, :studies_start_date,
                                               :studies_end_date, :start_scholarship, :end_scholarship, :school, :entity,
                                               :support_to_get, :program, :expertise_area, :field_study, :discipline
                                            ])
  end

end
