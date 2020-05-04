class Curriculum < ApplicationRecord
  belongs_to :student
  has_one_attached :profile_picture
  has_one_attached :curriculum_file
  has_many :education_histories
  has_many :languages
  has_many :certifications
  has_many :work_experiences

  accepts_nested_attributes_for :education_histories, :languages, :certifications, :work_experiences, allow_destroy: true
end
