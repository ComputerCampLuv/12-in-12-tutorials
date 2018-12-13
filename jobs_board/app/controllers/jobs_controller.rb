class JobsController < ApplicationController
  before_action :get_job, only: [:show, :edit, :update, :destroy]

  def index

    if !params.has_key?(:category)
      @jobs = Job.all.order(created_at: 'DESC')
    else
      @jobs = Job.where(category_id: params[:category])
    end
  end

  def show
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)

    if @job.save
      redirect_to @job
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @job.update(job_params)
      redirect_to @job
    else
      render 'edit'
    end
  end

  def destroy
    @job.destroy
    redirect_to jobs_path
  end

  private
  def job_params
    params.require(:job).permit(:title, :description, :company, :url, :category_id)
  end

  def get_job
    @job = Job.find(params[:id])
  end
end
