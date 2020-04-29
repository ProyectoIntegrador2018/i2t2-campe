class CompanyPolicy < ApplicationPolicy

  def index?
    @user.is_admin_or_super_admin?
  end

  def show?
    !@user.student?
  end

  def edit?
    is_mine_or_super_admin?
  end

  def update?
    edit?
  end

  private
  def is_mine_or_super_admin?
    @record.company_id == @user.company.id or @user.super_admin?
  end
end

