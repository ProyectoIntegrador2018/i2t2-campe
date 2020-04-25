class AddSkillsToCurriculum < ActiveRecord::Migration[5.2]
  def change
    add_column :curriculums, :skills, :string, array: true
  end
end
