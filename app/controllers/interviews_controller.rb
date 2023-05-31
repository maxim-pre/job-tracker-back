class InterviewsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_job, only: %i[index create show update destroy]


    def index 
        @interviews = @job.interviews
        render json: @interviews
    end

    def create 
        @interview = Interview.new(interview_params)
        @interview.job_id = @job.id

        if @interview.save 
            render json: {status: 'SUCCESS', message: 'interview is saved', data:@interview }, status: :ok
        else
            render json: {status: 'Error', message: 'error saving interview', data:@interview.errors}, status: :unprocessable_entity
        end
    end

    def update 
        @interview = @job.interviews.find(params[:id])
        if @interview.update(interview_params)
            render json: {status: 'SUCCESS', message:'interview updated', data:@interview}, status: :ok 
        else
            render json: {status: 'Error', message:'Unable to update interview', data:@interview}, status: :unprocessable_entity
        end
    end

    def destroy 
        @interview = @job.interviews.find(params[:id])
        @interview.destroy 
        render json: {status:'SUCCESS', message: 'interview successfully deleted', data:@interview}, status: :ok
    end

    private 
    def interview_params 
        params.permit(:date, :format, :interview_type)
    end

    def set_job 
        @job = current_user.jobs.find(params[:job_id])
    end
end
