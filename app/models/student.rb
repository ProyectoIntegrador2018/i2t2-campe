# frozen_string_literal: true

class Student < ApplicationRecord
  audited
  belongs_to :user
  has_one :contact_information
  has_many :scholarships
  has_many :scholarship_oportunities, through: :scholarships

  accepts_nested_attributes_for :contact_information
end

