class PagesController < ApplicationController
  def home
    if current_user.nil?
      redirect_to new_user_session_path
    else
      if current_user.is_admin_or_super_admin?
        redirect_to pages_path
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
