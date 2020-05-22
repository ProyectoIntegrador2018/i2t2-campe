class CurriculumPolicy < ApplicationPolicy
  def new?
    @user.former_student?
  end

  def create?
    @user.former_student?
  end

  def show?
    return student_applied_to_company? if @user.company?
    is_mine_or_admin?
  end

  def update?
    @user.former_student? and is_mine?
  end

  private
  def is_mine_or_admin?
    return true if @user.is_admin_or_super_admin?

    @user.former_student? and is_mine?
  end

  def student_applied_to_company?
    @user.company.job_postings.find(@record.student.job_applications.pluck("job_posting_id")).any?
  end

  def is_mine?
    @record.student.id == @user.student.id
  end
end
