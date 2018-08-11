class ApplicantsController < ApplicationController
  before_action :set_applicants
  before_action :set_applicant, only: [:show, :edit, :update, :destroy]

  # GET jobs/1/applicants
  def index
    @applicants = @job.applicants
  end

  # GET jobs/1/applicants/1
  def show
  end

  # GET jobs/1/applicants/new
  def new
    @applicant = @job.applicants.build
  end

  # GET jobs/1/applicants/1/edit
  def edit
  end

  # POST jobs/1/applicants
  def create
    @applicant = @job.applicants.build(applicant_params)

    if @applicant.save
      redirect_to([@applicant.job, @applicant], notice: 'Applicant was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT jobs/1/applicants/1
  def update
    if @applicant.update_attributes(applicant_params)
      redirect_to([@applicant.job, @applicant], notice: 'Applicant was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE jobs/1/applicants/1
  def destroy
    @applicant.destroy

    redirect_to job_applicants_url(@job)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_applicants
      @job = Job.find(params[:job_id])
    end

    def set_applicant
      @applicant = @job.applicants.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def applicant_params
      params.require(:applicant).permit(:name, :phone, :email)
    end
end
