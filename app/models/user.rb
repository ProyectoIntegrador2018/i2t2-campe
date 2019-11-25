# frozen_string_literal: true

# La clase responsable  de user
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :groups_users
  has_many :groups, through: :groups_users

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
      
         
  def update_imported_user(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(4)
    puts(header)
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
