# frozen_string_literal: true

# Class responsible for student personal information.
class Student < ApplicationRecord
  belongs_to :user
  has_one :contact_information
end

