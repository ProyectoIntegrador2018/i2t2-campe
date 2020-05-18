# frozen_string_literal: true

# La clase responsable  de user
class User < ApplicationRecord
  enum role: [:student, :admin, :super_admin, :former_student, :company]

  after_initialize :set_default_role, :if => :new_record?

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  has_one :student
  has_one :company

  accepts_nested_attributes_for :student, :company

  def set_default_role
    self.role ||= :student
  end

  def is_admin_or_super_admin?
    self.admin? or self.super_admin?
  end

  def is_student_or_former_student?
    self.student? or self.former_student?
  end

  def is_company_or_super_admin?
    self.company? or self.super_admin?
  end

  def update_imported_user(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(4)
    header = 'email'
    header = header.to_a
    (5..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      # @store = Store.new(row)
      @user = User.new(email: row['email'])
      @user.save
    end
  end

  def self.to_csv
    headers = [
      "Correo", "CVU", "Nombre", "Apellido Paterno", "Apellido Materno", "RFC",
      "CURP", "Genero", "Estado marital", "Fecha de nacimiento", "Pais de nacimiento",
      "Estado de nacimiento", "Calle", "Numero Ext", "Numero Int", "Colonia",
      "Ciudad", "Municipio", "Estado", "Telefono", "Celular", "Empresa actual",
      "Puesto actual",
    ]

    CSV.generate(headers: true) do |csv|
      csv << headers

      all.each do |user|
        csv << user.get_all_attributes
      end
    end
  end

  def get_all_attributes
    attributes = [self.email]
    if self.student
      attributes += [
        self.student.cvu,
        self.student.name,
        self.student.paternal_last_name,
        self.student.maternal_last_name,
        self.student.rfc,
        self.student.curp,
        self.student.gender,
        self.student.marital_status,
        self.student.birth_date,
        self.student.country_birth,
        self.student.state_birth,
      ]

      if self.student.contact_information
        attributes += [
          self.student.contact_information.street_address,
          self.student.contact_information.street_number_address_ext,
          self.student.contact_information.street_number_address_int,
          self.student.contact_information.neighborhood,
          self.student.contact_information.city,
          self.student.contact_information.municipality,
          self.student.contact_information.state,
          self.student.contact_information.phone_number,
          self.student.contact_information.cellphone_number,
        ]
      end

      if self.student.curriculum
        current_job = self.student.curriculum.current_job
        if current_job.any?
          current_job = current_job.first
          attributes += [
            current_job.company,
            current_job.title,
          ]
        end
      end
    end
    attributes
  end
end
