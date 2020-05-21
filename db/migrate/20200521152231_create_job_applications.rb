class CreateJobApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :job_applications do |t|
      t.integer :job_posting_id
      t.integer :student_id

      t.timestamps
    end
  end
end
