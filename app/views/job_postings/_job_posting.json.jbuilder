json.extract! job_posting, :id, :title, :salary, :description, :number_positions, :keywords, :employment_type, :responsabilities, :experience_required, :created_at, :updated_at
json.url job_posting_url(job_posting, format: :json)
