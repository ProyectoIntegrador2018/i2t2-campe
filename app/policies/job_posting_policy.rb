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

  def my_job_postings?
    @user.is_company_or_super_admin?
  end

  def candidates?
    return true if @user.is_admin_or_super_admin?

    @user.company? and is_mine?
  end

  def index?
    @user.is_admin_or_super_admin? or @user.former_student?
  end

  private
  def is_mine?
    return @record.company_id == @user.company.id
  end
end

