class ScholarshipsController < ApplicationController
  include ApplicationHelper

  def index
  end

  def new
    @scholarship = Scholarship.new
    @scholarship_oportunities = ScholarshipOportunity.all
  end

  def show
  end

  def import_scholarships
    import_users(params[:file], 'student', students_path, scholarship_oportunities_path(params[:scholarship_oportunity_id].to_i))
  end

  private

  def scholarship_params
    params.require(:scholarship).permit(:student_id, :scholarship_oportunity_id)
  end

  def user_params
    params.require(:user).permit(:name, :paternal_last_name, :maternal_last_name, :email, :password, :password_confirmation, :request_password_it2t2, :creation_date, :desc_request_status, :cvu,
                                 :rfc, :curp, :gender, :marital_stauts, :birth_date, :country_birth, :state_birth, :street_address, :street_number_address_ext, :street_number_address_int, :colony_address, :city_address, :municipiality_address,
                                 :state_address, :phone_number, :cell_phone, :convocatory, :fiscal_year, :studies_start_date, :studies_end_date, :start_scholarship, :end_scholarship, :school, :entity, :support_to_get, :program, :expertise_area,
                                 :field_study, :discipline, :sub_discipline, :last_gpa)
  end


end
