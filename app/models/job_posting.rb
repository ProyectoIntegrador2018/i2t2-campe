class JobPosting < ApplicationRecord
  belongs_to :company

  scope :not_expired, -> { where("expiration > ?", Time.now) }
end
