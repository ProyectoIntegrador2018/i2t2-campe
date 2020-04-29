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

  def index?
    not @user.student?
  end
end

