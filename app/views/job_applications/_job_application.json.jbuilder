json.extract! job_application, :id, :job_posting_id, :student, :created_at, :updated_at
json.url job_application_url(job_application, format: :json)
