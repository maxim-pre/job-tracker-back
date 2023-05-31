class NotesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_job, only: %i[index create show update destroy]

    def index 
        @notes = @job.notes 
        render json: @notes 
    end

    def create 
        @note = Note.new((note_params))
        @note.job_id = @job.id
        if @note.save 
            render json: {status: 'SUCCESS', message: 'note is saved', data:@note }, status: :ok
        else
            render json: {status: 'Error', message: 'error saving note', data:@note.errors}, status: :unprocessable_entity
        end
    end

    def update 
        @note = @job.notes.find(params[:id])
        if @note.update(note_params)
            render json: {status: 'SUCCESS', message:'note updated', data:@note}, status: :ok 
        else
            render json: {status: 'Error', message:'Unable to update note', data:@note}, status: :unprocessable_entity
        end
    end

    def destroy 
        @note = @job.notes.find(params[:id])
        @note.destroy 
        render json: {status:'SUCCESS', message: 'note successfully deleted', data:@note}, status: :ok
    end



    private 
    def set_job 
        @job = current_user.jobs.find(params[:job_id])
    end

    def note_params 
        params.permit(:title, :description)
    end
end
