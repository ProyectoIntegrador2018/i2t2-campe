require 'roo'
class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def import_user
    file = params[:file]
    file_type = ile_type = file.present? ? file.original_filename.split('.').last.to_s.downcase : ''
    if file.present? and (file_type == 'csv' or file_type == 'xlsx' or file_type == 'xls')
      update_imported_user(file)
    else
      redirect_to users_path, flash: {danger: 'csv'} 
    end
  end

  def export_user
  end
  private
  def clean(headers)
    (0..headers.length).each do |i|
    end
    headers
  end
  
  def update_imported_user(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    puts(header)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      # @store = Store.new(row)
      @user = User.new(email: row['CORREO'],:password => "111111", :password_confirmation => "111111", request_password_it2t2: row["CLAVESOLICITUD"],
      creation_date: row["FECHA"+'\n'+"CREACION"], desc_request_status: row["DESCESTATUSSOLICITUD"], cvu: row["CVU"], name: row["NOMBRE"], paternal_last_name: row["APELLIDOPATERNO"],
      maternal_last_name: row["APELLIDOMATERNO"], rfc: row["RFC"], curp: row["CURP"], gender: row["GÉNERO"], marital_stauts: row["ESTADOCIVIL"], birth_date: row["FECHANACIMIENTO"], 
      country_birth: row["ESTADONACIMIENTO"]), 
      @user.save
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
end
