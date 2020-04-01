# frozen_string_literal: true

# Class responsible for student personal information.
class Student < ApplicationRecord
  belongs_to :user
  has_one :contact_information

  accepts_nested_attributes_for :contact_information
end

