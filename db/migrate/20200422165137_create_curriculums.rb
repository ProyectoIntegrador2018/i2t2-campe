class CreateCurriculums < ActiveRecord::Migration[5.2]
  def change
    create_table :curriculums do |t|
      t.references :student, foreign_key: true
      t.text :professional_objective
      t.integer :min_desired_salary
      t.integer :max_desired_salary
      t.string :desired_position

      t.timestamps
    end
  end
end
