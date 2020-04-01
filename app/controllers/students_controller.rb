require 'roo'
class StudentsController < ApplicationController

  def index
    @users = User.student
  end

  def show
    @student = Student.find(params[:id])
    @user = @student.user
  end

  def new
    @user = User.new
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private
  def clean(headers)
    (0..headers.length).each do |i|
    end
    headers
  end

end
