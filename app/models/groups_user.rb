#Clase de  relacion m a n entre grupos y users
class GroupsUser < ApplicationRecord
  belongs_to :group
  belongs_to :student
end