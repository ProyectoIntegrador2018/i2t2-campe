class CreateScholarship < ActiveRecord::Migration[5.2]
  def change
    create_table :scholarship do |t|
      t.integer :student_id
      t.integer :scholarship_oportunity_id
      t.integer :status
      t.string :application_id
      t.datetime :fiscal_year
      t.datetime :creation_date
      t.datetime :studies_start
      t.datetime :studies_end
      t.datetime :start
      t.datetime :end
      t.string :institution
      t.string :entity
      t.string :desired_support
      t.string :program
      t.string :study_field
      t.string :study_area
      t.string :discipline
      t.string :sub_discipline
      t.integer :degree_level
      t.decimal :most_recent_gpa

      t.timestamps
    end
  end
end
