class CreateEducationHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :education_histories do |t|
      t.references :curriculum, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.string :area_of_study
      t.string :university

      t.timestamps
    end
  end
end
