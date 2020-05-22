class PagesController < ApplicationController
  def home
    if current_user.nil?
      redirect_to new_user_session_path
    else
      if current_user.is_admin_or_super_admin?
        redirect_to pages_path
      elsif current_user.first_time_former_student?
        redirect_to first_time_login_path
      elsif current_user.company?
        redirect_to my_job_postings_path
      else
        redirect_to student_path(current_user.student.id)
      end
    end
  end

  def index
    authorize User
    @users = User.student
  end

end
