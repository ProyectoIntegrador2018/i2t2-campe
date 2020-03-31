class PagesController < ApplicationController
  before_action :set_current_student, only: [:index]
  def home
  end

  def index
    @users = User.student
  end

  private

  def set_current_student
    if current_user.try :student?
      @student = current_user.student
      @contact_information = @student.contact_information
    end
  end
end
