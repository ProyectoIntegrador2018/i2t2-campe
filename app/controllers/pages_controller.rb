class PagesController < ApplicationController
  def home
  end

  def index
    @users = User.student
  end
end
