# frozen_string_literal: true

# Esta es la clase de convocatorias
class ScholarshipOportunity < ApplicationRecord
  has_many :scholarship
  has_many :students, through: :scholarship
end
