require 'roo'
class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :history]
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
    @student.update!(student_params)
    redirect_to student_path(@student)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  def history
    authorize @student
    @history = @student.audits
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

  def student_params
    params.require(:student).permit(
      :cvu,
      :name,
      :paternal_last_name,
      :maternal_last_name,
      :rfc,
      :curp,
      :gender,
      :marital_status,
      :birth_date,
      :country_birth,
      :state_birth,
    )
  end

end
