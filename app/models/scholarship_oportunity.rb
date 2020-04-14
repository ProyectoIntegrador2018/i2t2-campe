# frozen_string_literal: true

class ScholarshipOportunity < ApplicationRecord
  has_many :scholarships
  has_many :students, through: :scholarships
end
