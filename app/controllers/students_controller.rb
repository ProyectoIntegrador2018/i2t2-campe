require 'roo'
class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update]

  def index
    authorize User
    @users = User.student
  end

  def show
    @user = @student.user
    authorize @student
  end

  def edit
    authorize User
  end

  def update
    authorize User
    params.permit!
    @student.update(params[:student])
    redirect_to student_path(@student)
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

  def set_student
    @student = Student.find(params[:id])
  end

end
