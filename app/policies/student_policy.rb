class StudentPolicy < ApplicationPolicy
  def show?
    return true if @user.is_admin_or_super_admin?

    @record.id == @user.student.id
  end
end
