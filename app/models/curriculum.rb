class Curriculum < ApplicationRecord
  belongs_to :student
  has_one_attached :profile_picture
  has_many :languages

  accepts_nested_attributes_for :languages
end
