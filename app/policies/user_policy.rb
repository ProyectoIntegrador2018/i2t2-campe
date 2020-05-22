class UserPolicy < ApplicationPolicy

  def new?
    @user.try :super_admin?
  end

  def new_with_student?
    @user.try :is_admin_or_super_admin?
  end

  def new_with_company?
    @user.try :is_admin_or_super_admin?
  end

  def new_with_former_student?
    @user.try :is_admin_or_super_admin?
  end

  def former_students?
    @user.try :is_admin_or_super_admin?
  end

  def former_students_upload?
    @user.try :is_admin_or_super_admin?
  end

  def import_former_students?
    @user.try :is_admin_or_super_admin?
  end

  def first_time_login?
    @user.try :first_time_former_student?
  end
end
