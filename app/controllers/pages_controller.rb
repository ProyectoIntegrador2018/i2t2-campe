class PagesController < ApplicationController
  before_action :admin_authorization, only: [:index]

  def home
  end

  def index
    @users = User.student
  end

  private

  def admin_authorization
    redirect_to student_path (current_user.student) if current_user.try :student?
  end
end
