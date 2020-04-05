class ScholarshipOportunitiesController < ApplicationController
  def new
    @scholarship_oportunity = ScholarshipOportunity.new
  end

  def index
    @scholarship_oportunities = ScholarshipOportunity.all
  end

  def show
    @scholarship_oportunity = ScholarshipOportunity.find(params[:id])
    @students = @scholarship_oportunity.students
  end

  def create
    @scholarship_oportunity = ScholarshipOportunity.new(scholarship_oportunity_params)
    @scholarship_oportunity.name = @scholarship_oportunity.name.parameterize(separator: '_')

    unless ScholarshipOportunity.exists?(name: @scholarship_oportunity.name)
      @scholarship_oportunity.save
      redirect_to scholarship_oportunities_path
    end
  end

  def destroy
    @scholarship_oportunity = ScholarshipOportunity.find(params[:id])
    @scholarship_oportunity.destroy
    redirect_to scholarship_oportunities_path
  end

  private
  def scholarship_oportunity_params
    params.require(:scholarship_oportunity).permit(:name)
  end
end
