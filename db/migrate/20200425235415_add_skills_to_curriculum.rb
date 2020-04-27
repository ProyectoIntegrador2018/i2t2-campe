class AddSkillsToCurriculum < ActiveRecord::Migration[5.2]
  def change
    add_column :curriculums, :skills, :text
  end
end
