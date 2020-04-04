# frozen_string_literal: true

class Scholarship < ApplicationRecord
  belongs_to :student
  belongs_to :scholarship_oportunity
end
