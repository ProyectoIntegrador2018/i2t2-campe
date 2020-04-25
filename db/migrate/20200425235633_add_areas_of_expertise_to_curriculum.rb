class AddAreasOfExpertiseToCurriculum < ActiveRecord::Migration[5.2]
  def change
    add_column :curriculums, :areas_of_expertise, :string, array: true
  end
end
