class Curriculum < ApplicationRecord
  belongs_to :student
  has_one_attached :profile_picture
  has_many :education_histories
  has_many :languages
  has_many :certifications

  accepts_nested_attributes_for :education_histories, :languages
end
