class CurriculumsController < ApplicationController
  before_action :set_curriculum, only: [:show, :edit, :update]
  before_action :authorize_former_student, only: [:new, :create]
  before_action :authorize_curriculum, only: [:edit, :update, :show]

  def new
    @curriculum = Curriculum.new
  end

  def create
    @curriculum = Curriculum.new(curriculum_params)
    @curriculum.student_id = current_user.student.id
    @curriculum.save!
    redirect_to curriculum_path(@curriculum)
  end

  def update
    @curriculum.update!(curriculum_params)
    redirect_to curriculum_path(@curriculum)
  end

  def edit
  end

  def show
  end

  private
  def set_curriculum
    @curriculum = Curriculum.find(params[:id])
  end

  def curriculum_params
    params.require(:curriculum).permit(:professional_objective)
  end

  def authorize_former_student
    authorize Curriculum
  end

  def authorize_curriculum
    authorize @curriculum
  end
end
