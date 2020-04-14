require 'roo'
class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy, :history]
  before_action :authorize_user, only: [:index, :destroy]
  before_action :authorize_update, only: [:edit, :update]

  FIELD_TO_NAME = { 
    'cvu' => 'CVU',
    'name' => 'Nombre',
    'paternal_last_name' => 'Apellido Paterno',
    'maternal_last_name' => 'Apellido Materno',
    'rfc' => 'RFC',
    'curp' => 'CURP',
    'gender' => 'Género',
    'marital_status' => 'Estado Civil',
    'birth_date' => 'Fecha de Nacimiento',
    'country_birth' => 'País de Nacimiento',
    'state_birth' => 'Estado de Nacimiento',
    'degree_level' => 'Grado de Estudios',
    'street_number_address_ext' => 'Número Exterior',
    'street_number_address_int' => 'Número Interior',
    'neighborhood' => 'Colonia',
    'city' => 'Ciudad',
    'state' => 'Estado',
    'phone_number' => 'Teléfono',
    'cellphone_number' => 'Celular',
  }

  def index
    @users = User.student
  end

  def show
    @user = @student.user
    authorize @student
  end

  def edit
  end

  def update
    @student.update!(student_params)
    redirect_to student_path(@student)
  end

  def destroy
    @user = @student.user
    @user.destroy
    redirect_to students_path
  end

  def history
    authorize @student
    @student_history = @student.audits
    @contact_information_history = @student.contact_information.audits
  end

  private
  def clean(headers)
    (0..headers.length).each do |i|
    end
    headers
  end

  def set_student
    @student = Student.find(params[:id])
  end

  def authorize_user
    authorize User
  end

  def authorize_update
    authorize @student 
  end

  def student_params
    params_allowed = [{contact_information_attributes: [:id,
                                                        :street_address,
                                                        :street_number_address_ext,
                                                        :street_number_address_int,
                                                        :neighborhood,
                                                        :city,
                                                        :municipality,
                                                        :state,
                                                        :phone_number,
                                                        :cellphone_number]}]
    params_allowed += [:cvu,
                       :name,
                       :paternal_last_name,
                       :maternal_last_name,
                       :rfc,
                       :birth_date,
                       :curp,
                       :gender,
                       :marital_status,
                       :country_birth,
                       :state_birth] if current_user.is_admin_or_super_admin?
    params.require(:student).permit(params_allowed)
  end

  def get_field_name(field)
    FIELD_TO_NAME[field]
  end
  helper_method :get_field_name
end
