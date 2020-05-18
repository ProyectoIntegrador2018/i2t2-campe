class JobPosting < ApplicationRecord
  belongs_to :company

  filterrific(
    available_filters: [
      :search_name
    ]
  )

  scope :search_name, -> (query_name) { where("title LIKE ?", "%#{query_name}%") }
  scope :not_expired, -> { where("expiration > ?", Time.now) }
end
