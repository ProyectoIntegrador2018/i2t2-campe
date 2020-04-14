require 'roo'
class ScholarshipsController < ApplicationController
  def index
  end

  def new
    @scholarship = Scholarship.new
    @scholarship_oportunities = ScholarshipOportunity.all
  end

  def show
  end

  def import_scholarships
    file = params[:file]
    file_type = file_type = file.present? ? file.original_filename.split('.').last.to_s.downcase : ''
    if file.present? and (file_type == 'csv' or file_type == 'xlsx' or file_type == 'xls')
      update_imported_user(file)
    else
      redirect_to users_path, flash: {danger: 'csv'}
    end
  end

  private

  def update_imported_user(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      puts(header)
      user = User.new(
        email: row['CORREO'],
        :password => '111111',
        :password_confirmation => '111111'
      )

      user.build_student(
        cvu: row['CVU'],
        name: row['NOMBRE'],
        paternal_last_name: row['APELLIDO PATERNO'],
        maternal_last_name: row['APELLIDO MATERNO'],
        rfc: row['RFC'],
        curp: row['CURP'],
        gender: row['GÉNERO'],
        marital_status: row['ESTADO CIVIL'],
        birth_date: row['FECHA NACIMIENTO'],
        state_birth: row['ESTADO NACIMIENTO']
      )

      user.student.build_contact_information(
        street_address: row['DOMICILIO CALLE'],
        street_number_address_ext: row['DOMICILIO NUM. EXT.'],
        street_number_address_int: row['DOMICILIO NUM. INT.'],
        neighborhood: row['DOMICILIO COLONIA'],
        city: row['DOMICILIO CIUDAD'],
        municipality: row['DOMICILIO MUNICIPIO'],
        state: row['DOMICILIO ESTADO'],
        phone_number: row['TELÉFONO'],
        cellphone_number: row['CELULAR']
      )
      user.student.scholarships.build(
        scholarship_oportunity_id: params[:scholarship_oportunity_id].to_i,
        studies_start: row['INICIO DE ESTUDIOS'],
        studies_end: row['FIN DE ESTUDIOS'],
        start: row['INICIO DE BECA'],
        end: row['FIN DE BECA'],
        institution: row['INSTITUCIÓN'],
        entity: row['ENTIDAD'],
        desired_support: row['APOYO A OBTENER'],
        program: row['PROGRAMA'],
        study_area: row['ÁREA DEL CONOCIMIENTO'],
        study_field: row['CAMPO'],
        discipline: row['DISCIPLINA'],
        sub_discipline: row['SUBDISCIPLINA'],
        most_recent_gpa: row['PROMEDIO ÚLTIMO GRADO']
      )
      user.save
    end
    redirect_to scholarship_oportunities_path(params[:scholarship_oportunity_id].to_i)
  end

  def open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then  Roo::CSV.new(file.path, packed: nil, file_warning: :ignore, csv_options: {encoding: Encoding::SJIS})
    when ".xls" then  Roo::Excel.new(file.path, packed: nil, file_warning: :ignore)
    when ".xlsx" then  Roo::Excelx.new(file.path, packed: nil, file_warning: :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

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
