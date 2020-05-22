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
    return true if @user.super_admin?
    @user.company? and @record.company_id == @user.company.id
  end
end

