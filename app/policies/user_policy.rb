class UserPolicy < ApplicationPolicy

  def new?
    @user.try :super_admin?
  end

  def new_with_student?
    @user.try :is_admin_or_super_admin?
  end
end
