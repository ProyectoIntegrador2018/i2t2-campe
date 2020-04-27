class CurriculumsController < ApplicationController
  before_action :set_curriculum, only: [:show, :edit, :update]
  before_action :authorize_curriculum, only: [:edit, :update, :show]

  def new
    @curriculum = Curriculum.new
  end

  def create
    @curriculum = Curriculum.new(curriculum_params)
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
    params.require(:curriculum).permit()
  end

  def authorize_curriculum
    authorize @curriculum
  end
end
