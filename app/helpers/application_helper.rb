require 'roo'

module ApplicationHelper

  def mx_state_list
    [
      ["Aguascalientes", "Aguascalientes"],
      ["Baja California", "Baja California"],
      ["Baja California Sur", "Baja California Sur"],
      ["Chihuahua", "Chihuahua"],
      ["Campeche", "Campeche"],
      ["Ciudad de México", "Ciudad de México"],
      ["Coahuila", "Coahuila"],
      ["Colima", "Colima"],
      ["Durango", "Durango"],
      ["Guerrero", "Guerrero"],
      ["Guanajuato", "Guanajuato"],
      ["Hidalgo", "Hidalgo"],
      ["Jalisco", "Jalisco"],
      ["Michoacan", "Michoacan"],
      ["Estado de México", "Estado de México"],
      ["Morelos", "Morelos"],
      ["Nayarit", "Nayarit"],
      ["Nuevo León", "Nuevo León"],
      ["Oaxaca", "Oaxaca"],
      ["Puebla", "Puebla"],
      ["Quintana Roo", "Quintana Roo"],
      ["Sinaloa", "Sinaloa"],
      ["San Luis Potosí", "San Luis Potosí"],
      ["Sonora", "Sonora"],
      ["Tabasco", "Tabasco"],
      ["Tlaxcala", "Tlaxcala"],
      ["Tamaulipas", "Tamaulipas"],
      ["Veracruz", "Veracruz"],
      ["Yucatán", "Yucatán"],
      ["Zacatecas", "Zacatecas"]
    ]
  end

  def humanized_role_name(current_user)
    return "Becario" if current_user.student?
    return "Administrador" if current_user.admin?
    return "Super Administrador" if current_user.super_admin?
    return "Exbecario" if current_user.former_student?
    return "Empresa" if current_user.company?
  end

  def import_users(file, role, error_redirect, success_redirect)
    file_type = file_type = file.present? ? file.original_filename.split('.').last.to_s.downcase : ''
    if file.present? and (file_type == 'csv' or file_type == 'xlsx' or file_type == 'xls')
      update_imported_user(file, role, success_redirect)
    else
      redirect_to error_redirect, alert: "Archivo no existente o formato incorrecto."
    end
  end

  def update_imported_user(file, role, success_redirect)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    errors = 0
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      puts(header)
      user = User.new(
        email: row['CORREO'],
        :password => row['CURP'],
        :password_confirmation => row['CURP'],
        :role => role
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
        state_birth: row['ESTADO NACIMIENTO'],
        country_birth: row['PAÍS NACIMIENTO']
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
      if user.student?
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
      end
      if !user.save
        errors += 1
      end
    end
    if errors
      redirect_to success_redirect, alert: "Error al crear #{errors} usuarios. Verifica que el correo no esté repetido."
    else
      redirect_to success_redirect
    end
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
