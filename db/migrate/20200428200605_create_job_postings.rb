class CreateJobPostings < ActiveRecord::Migration[5.2]
  def change
    create_table :job_postings do |t|
      t.string :title
      t.integer :salary
      t.text :description
      t.integer :number_positions
      t.string :keywords
      t.string :employment_type
      t.text :responsabilities
      t.string :experience_required
      t.date :expiration

      t.integer :company_id
      t.timestamps
    end
  end
end
