# frozen_string_literal: true

class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.integer :cvu
      t.string :name
      t.string :paternal_last_name
      t.string :maternal_last_name
      t.string :rfc
      t.string :curp
      t.string :gender
      t.string :marital_status
      t.date :birth_date
      t.string :country_birth
      t.string :state_birth
      t.string :degree_level

      t.integer :user_id
    end
  end
end
