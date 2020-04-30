class EditWorkExperiences < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :work_experiences, column: :student_id
    remove_column :work_experiences, :student_id
    add_column :work_experiences, :curriculum_id, :BigInt
    add_foreign_key :work_experiences, :curriculums
  end
end
