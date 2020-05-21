# frozen_string_literal: true

class Student < ApplicationRecord
  audited
  belongs_to :user
  has_one :contact_information
  has_one :curriculum
  has_one :unemployment_datum
  has_many :scholarships
  has_many :scholarship_oportunities, through: :scholarships
  has_many :job_applications
  has_many :job_postings, through: :job_applications

  accepts_nested_attributes_for :contact_information, :scholarships, :curriculum, :unemployment_datum

  def full_name
    [self.name, self.paternal_last_name, self.maternal_last_name].join(' ').squeeze(' ')
  end
end

