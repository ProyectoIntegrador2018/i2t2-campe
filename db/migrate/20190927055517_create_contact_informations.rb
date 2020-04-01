# frozen_string_literal: true

class CreateContactInformations < ActiveRecord::Migration[5.2]
  def change
    create_table :contact_informations do |t|
      t.string :street_address
      t.string :street_number_address_ext
      t.string :street_number_address_int
      t.string :neighborhood
      t.string :city
      t.string :municipality
      t.string :state
      t.string :phone_number
      t.string :cellphone_number

      t.integer :student_id
    end
  end
end
