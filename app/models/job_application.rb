class JobApplication < ApplicationRecord
  belongs_to :student
  belongs_to :job_posting
end
