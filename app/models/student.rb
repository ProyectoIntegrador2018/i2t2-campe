# frozen_string_literal: true

class Student < ApplicationRecord
  audited
  belongs_to :user
  has_one :contact_information
  has_one :curriculum
  has_many :scholarships
  has_many :scholarship_oportunities, through: :scholarships
  has_many :work_experiences

  accepts_nested_attributes_for :contact_information, :scholarships, :curriculum
end

