class CurriculumPolicy < ApplicationPolicy
  def new?
    @user.former_student?
  end

  def create?
    @user.former_student?
  end

  def show?
    is_mine_or_admin?
  end

  def update?
    @user.former_student? and is_mine?
  end

  private
  def is_mine_or_admin?
    return true if @user.is_admin_or_super_admin?

    is_mine?
  end

  def is_mine?
    @record.student.id == @user.student.id
  end
end
