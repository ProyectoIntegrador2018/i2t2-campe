class Company < ApplicationRecord
  belongs_to :user
  has_many :job_postings, dependent: :destroy
  has_one_attached :logo, dependent: :destroy

  def self.options_for_select
    order("LOWER(name)").map { |el| [el.name, el.id] }
  end
end
