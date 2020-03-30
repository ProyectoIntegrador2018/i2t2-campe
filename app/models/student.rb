# frozen_string_literal: true

# Class responsible for student personal information.
class Student < ApplicationRecord
  belongs_to :user
end

