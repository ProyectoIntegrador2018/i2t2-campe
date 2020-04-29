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
end
