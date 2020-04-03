class CreateScholarshipOpportunities < ActiveRecord::Migration[5.2]
  def change
    create_table :scholarship_opportunities do |t|
      t.string :name
      t.integer :number
      t.timestamps
    end
  end
end
