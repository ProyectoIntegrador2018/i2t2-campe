require 'roo'
class GroupsUsersController < ApplicationController
  def index
  end

  def new
    @groups_user = GroupsUser.new
    @groups = Group.all
  end

  def show
  end

  def import_groups_users
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
      @groups_user = GroupsUser.new()
      @user = User.new(
        email: row['CORREO'],
        :password => '111111', 
        :password_confirmation => '111111', 
        request_password_it2t2: row['CLAVESOLICITUD'],
        creation_date: row['FECHA'+'\n'+'CREACION'], 
        desc_request_status: row['DESCESTATUSSOLICITUD'], 
        cvu: row['CVU'], name: row['NOMBRE'], 
        paternal_last_name: row['APELLIDOPATERNO'],
        maternal_last_name: row['APELLIDOMATERNO'], 
        rfc: row['RFC'], curp: row['CURP'], 
        gender: row['GÉNERO'], marital_stauts: row['ESTADOCIVIL'], 
        birth_date: row['FECHANACIMIENTO'], 
        country_birth: row['ESTADONACIMIENTO'], 
        street_address: row['DOMICILIOCALLE'], 
        street_number_address_ext: row['DOMICILIONUM.EXT.'], 
        street_number_address_int: row['DOMICILIONUM.INT.'],
        colony_address: row['DOMICILIOCOLONIA'], 
        city_address: row['DOMICILIOCIUDAD'], 
        municipiality_address: row['DOMICILIOMUNICIPIO'], 
        state_address: row['DOMICILIOESTADO'],
        phone_number: row['TELÉFONO'], 
        cell_phone: row['CELULAR'], 
        studies_start_date: row['INICIODEESTUDIOS'], 
        studies_end_date: row['FINDEESTUDIOS'], 
        start_scholarship: row['INICIODEBECA'], 
        end_scholarship: row['FINDEBECA'], 
        school: row['INSTITUCIÓN'], 
        entity: row['ENTIDAD'], 
        support_to_get: row['APOYOAOBTENER'], 
        program: row['PROGRAMA'], 
        expertise_area: row['ÁREADELCONOCIMIENTO'],
        field_study: row['CAMPO'], 
        discipline: row['DISCIPLINA'], 
        sub_discipline: row['SUBDISCIPLINA'], 
        last_gpa: row['PROMEDIOÚLTIMOGRADO']
      )
      @user.save
      @groups_user.user_id = @user.id
      @groups_user.group_id = params[:group_id].to_i
      @groups_user.save

    end
    redirect_to users_path
  end

  def open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then  Roo::CSV.new(file.path, packed: nil, file_warning: :ignore, csv_options: {encoding: Encoding::SJIS})
    when ".xls" then  Roo::Excel.new(file.path, packed: nil, file_warning: :ignore)
    when ".xlsx" then  Roo::Excelx.new(file.path, packed: nil, file_warning: :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

  def group_user_params
    params.require(:group_users).permit(:user_id, :group_id)
  end

  def user_params
    params.require(:user).permit(:name, :paternal_last_name, :maternal_last_name, :email, :password, :password_confirmation, :request_password_it2t2, :creation_date, :desc_request_status, :cvu,  
    :rfc, :curp, :gender, :marital_stauts, :birth_date, :country_birth, :state_birth, :street_address, :street_number_address_ext, :street_number_address_int, :colony_address, :city_address, :municipiality_address,
    :state_address, :phone_number, :cell_phone, :convocatory, :fiscal_year, :studies_start_date, :studies_end_date, :start_scholarship, :end_scholarship, :school, :entity, :support_to_get, :program, :expertise_area,
    :field_study, :discipline, :sub_discipline, :last_gpa)
  end


end