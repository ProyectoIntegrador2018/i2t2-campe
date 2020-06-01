class Curriculum < ApplicationRecord
  belongs_to :student
  has_one_attached :profile_picture
  has_one_attached :curriculum_file
  has_many :education_histories, dependent: :destroy
  has_many :languages, dependent: :destroy
  has_many :certifications, dependent: :destroy
  has_many :work_experiences, dependent: :destroy

  accepts_nested_attributes_for :education_histories, :languages, :certifications, :work_experiences, allow_destroy: true

  def current_job
    self.work_experiences.select { |we| we.is_current }
  end
end
