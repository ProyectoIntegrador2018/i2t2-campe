class StudentPolicy < ApplicationPolicy
  def show?
    is_mine_or_admin?
  end

  def history?
    is_mine_or_admin?
  end

  def update?
    is_mine_or_admin?
  end

  private
  def is_mine_or_admin?
    return true if @user.is_admin_or_super_admin?

    @record.id == @user.student.id
  end
end
