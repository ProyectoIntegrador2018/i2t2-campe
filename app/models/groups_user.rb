# frozen_string_literal: true

# Clase de  relacion m a n entre grupos y users
class GroupsUser < ApplicationRecord
  belongs_to :group
  belongs_to :user
end
