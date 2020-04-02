class PagesController < ApplicationController
  def home
  end

  def index
    authorize User
    @users = User.student
  end

end
