class ContactInformation < ApplicationRecord
  audited
  belongs_to :student
end
