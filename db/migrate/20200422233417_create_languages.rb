class CreateLanguages < ActiveRecord::Migration[5.2]
  def change
    create_table :languages do |t|
      t.references :curriculum, foreign_key: true
      t.string :language_name
      t.integer :proficiency

      t.timestamps
    end
  end
end
