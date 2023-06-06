class JobsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_job, only: %i[show update destroy]

    def index 
        @jobs = current_user.jobs
        render json: @jobs
    end

    def show 
        render json: @job
    end

    def create 
        @job = Job.new(job_params)
        @job.user_id = current_user.id

        if @job.save 
            render json: {status: 'SUCCESS', message: 'job is saved', data:@job }, status: :ok
        else
            render json: {status: 'Error', message: 'error saving job', data:@job.errors}, status: :unprocessable_entity
        end

    end

    def update 
        
        if @job.update(job_params)
            render json: {status: 'SUCCESS', message:'Job updated', data:@job}, status: :ok 
        else
            render json: {status: 'Error', message:'Unable to update job', data:@job, errors:@job.errors}, status: :unprocessable_entity
        end
    end

    def destroy 
        @job.destroy 

        render json: {status:'SUCCESS', message: 'Job successfully deleted', data:@job}, status: :ok
    end

    private 
    def job_params 
        params.permit(:title, :url, :company, :location, :description, :date_applied, :status, :min_salary, :max_salary, :pay_period, :follow_up_date, :created_at)
    end

    def set_job 
        @job = current_user.jobs.find(params[:id])
    end

end
