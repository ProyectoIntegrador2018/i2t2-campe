class CreateUnemploymentData < ActiveRecord::Migration[5.2]
  def change
    create_table :unemployment_data do |t|
      t.boolean :is_employed
      t.text :unemployment_reason
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
