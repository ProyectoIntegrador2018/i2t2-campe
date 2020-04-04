# frozen_string_literal: true

# Clase de  relacion m a n entre grupos y users
class Scholarship < ApplicationRecord
  belongs_to :student
  belongs_to :scholarship_oportunity
end
