class JobPostingsController < ApplicationController
  before_action :set_job_posting, only: [:show, :edit, :update, :destroy, :candidates]
  before_action :authorize_company, only: [:new, :create, :index]
  before_action :authrize_job_posting, only: [:edit, :update, :show]

  # GET /job_postings
  # GET /job_postings.json
  def index
    if current_user.company?
      @job_postings = current_user.company.job_postings
      return
    end

    @filterrific = initialize_filterrific(
      JobPosting,
      params[:filterrific],
      select_options: {
        with_company_id: Company.options_for_select
      },
      available_filters: [:search_name, :with_company_id, :keyword_search],
    ) || return

    @job_postings = @filterrific.find.not_expired.paginate(page: params[:page])
    @custom_paginate_renderer = custom_paginate_renderer
  end

  # GET /job_postings/1
  # GET /job_postings/1.json
  def show
  end

  def candidates
    @candidates = User.find(@job_posting.students.pluck("user_id"))
  end

  # GET /job_postings/new
  def new
    @job_posting = JobPosting.new
  end

  # GET /job_postings/1/edit
  def edit
  end

  # POST /job_postings
  # POST /job_postings.json
  def create
    @job_posting = JobPosting.new(job_posting_params)

    respond_to do |format|
      if @job_posting.save
        format.html { redirect_to @job_posting, notice: 'Job posting was successfully created.' }
        format.json { render :show, status: :created, location: @job_posting }
      else
        format.html { render :new }
        format.json { render json: @job_posting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_postings/1
  # PATCH/PUT /job_postings/1.json
  def update
    respond_to do |format|
      if @job_posting.update(job_posting_params)
        format.html { redirect_to @job_posting, notice: 'Job posting was successfully updated.' }
        format.json { render :show, status: :ok, location: @job_posting }
      else
        format.html { render :edit }
        format.json { render json: @job_posting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_postings/1
  # DELETE /job_postings/1.json
  def destroy
    @job_posting.destroy
    respond_to do |format|
      format.html { redirect_to job_postings_url, notice: 'Job posting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_job_posting
    @job_posting = JobPosting.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def job_posting_params
    params.require(:job_posting).permit(:title, :salary, :description, :number_positions, :keywords, :employment_type, :responsabilities, :experience_required, :expiration, :company_id)
  end

  def authorize_company
    authorize JobPosting
  end

  def authrize_job_posting
    authorize @job_posting
  end
end
