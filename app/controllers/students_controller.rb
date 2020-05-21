class StudentsController < ApplicationController
  include ApplicationHelper

  before_action :set_student, only: [:show, :edit, :update, :destroy, :history]
  before_action :authorize_user, only: [:index, :destroy, :former_students, :former_students_upload, :import_former_students, :first_time_login]
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

  def former_students
    @users = User.former_student
    
    respond_to do |format|
      format.html
      format.csv { send_data @users.to_csv }
    end
  end

  def former_students_upload
  end

  def import_former_students
    import_users(params[:file], 'former_student', former_students_upload_path, former_students_path)
  end

  def first_time_login
    @student = current_user.student
  end

  def show
    @user = @student.user
    authorize @student
  end

  def edit
  end

  def update
    @student.update!(student_params)
    if current_user.first_time_former_student?
      current_user.increment! :sign_in_count
      redirect_to new_curriculum_path
    else
      redirect_to student_path(@student)
    end
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
    params_allowed += [
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
      unemployment_datum_attributes:
        [
          :is_employed,
          :unemployment_reason,
        ],
    ] if current_user.is_admin_or_super_admin? or current_user.first_time_former_student?
    params.require(:student).permit(params_allowed)
  end

  def get_field_name(field)
    FIELD_TO_NAME[field]
  end
  helper_method :get_field_name
end
