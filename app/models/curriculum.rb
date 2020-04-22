class Curriculum < ApplicationRecord
  belongs_to :student
  has_one_attached :profile_picture
end
