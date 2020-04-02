require 'roo'
class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update]
  before_action :authorize_user, only: [:index, :edit, :update, :destroy]

  def index
    @users = User.student
  end

  def show
    @user = @student.user
    authorize @student
  end

  def edit
  end

  def update
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

  def authorize_user
    authorize User
  end

end
