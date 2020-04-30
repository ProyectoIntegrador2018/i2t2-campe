class CreateWorkExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :work_experiences do |t|
      t.references :student, foreign_key: true, null: false
      t.references :company, foreign_key: true, null: false
      t.string :entity
      t.string :country
      t.string :title
      t.string :study_area
      t.integer :degree_level

      t.timestamps
    end
  end
end
