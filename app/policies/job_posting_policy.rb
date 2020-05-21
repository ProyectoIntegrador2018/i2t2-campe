class JobPostingPolicy < ApplicationPolicy
  def new?
    @user.is_company_or_super_admin?
  end

  def create?
    @user.is_company_or_super_admin?
  end

  def show?
    not @user.student?
  end

  def update?
    @user.is_company_or_super_admin?
  end

  def edit?
    update?
  end

  def candidates?
    return true if @user.is_admin_or_super_admin?

    is_mine?
  end

  def index?
    not @user.student?
  end

  private
  def is_mine?
    return @record.company_id == @user.company.id
  end
end

