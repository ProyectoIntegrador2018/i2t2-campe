class Language < ApplicationRecord
  enum proficiency: [:elementary, :limited_working, :minimum_professional, :full_professional, :native_bilingual]

  belongs_to :curriculum
end
