class Company < ApplicationRecord
  belongs_to :user
  has_many :job_postings
  has_one_attached :logo
end
