# frozen_string_literal: true

# La clase responsable  de user
class User < ApplicationRecord
  enum role: [:student, :admin, :super_admin]

  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :student
  end

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  has_many :groups_users
  has_many :groups, through: :groups_users
  has_one :student

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
