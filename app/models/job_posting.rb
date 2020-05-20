class JobPosting < ApplicationRecord
  belongs_to :company

  filterrific(
    available_filters: [
      :search_name,
      :with_company_id,
      :keyword_search
    ]
  )

  scope :search_name, -> (query_name) { where("title LIKE ?", "%#{query_name}%") }
  scope :with_company_id, -> (company_id) { where("company_id = ?", company_id) }
  scope :keyword_search, -> (query_keyword) { where("keywords LIKE ?", "%#{query_keyword}%") }
  scope :not_expired, -> { where("expiration > ?", Time.now) }
end
