# frozen_string_literal: true

# Esta es la clase de convocatorias
class Group < ApplicationRecord
  has_many :groups_users
  has_many :users, through: :groups_users
end
