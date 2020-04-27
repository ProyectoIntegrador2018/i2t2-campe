class CreateCertifications < ActiveRecord::Migration[5.2]
  def change
    create_table :certifications do |t|
      t.references :curriculum, foreign_key: true
      t.string :emitting_organization
      t.string :certification_name
      t.date :date_emitted
      t.string :brief_description

      t.timestamps
    end
  end
end
