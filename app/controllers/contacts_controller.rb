class ContactsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_contact, only: %i[show update destroy]


    def index 
        @contacts = current_user.contacts 
        render json: @contacts
    end

    def show 
        render json: @contact
    end

    def create 
        @contact = Contact.new(contact_params)
        @contact.user_id = current_user.id
        if @contact.save 
            render json: {status: 'SUCCESS', message: 'contact is saved', data:@contact }, status: :ok
        else
            render json: {status: 'Error', message: 'error saving contact', data:@contact.errors}, status: :unprocessable_entity
        end
    end

    def update 

        if @contact.update(contact_params)
            render json: {status: 'SUCCESS', message:'Contact updated', data:@contact}, status: :ok 
        else 
            render json: {status: 'Error', message:'Unable to update contact', data:@contact}, status: :unprocessable_entity
        end

    end

    def destroy 
        @contact.destroy 
        render json: {status:"SUCCESS", message: 'contact successfully deleted', data:@contact}, status: :ok
    end


    private 
    def contact_params 
        params.permit(:first_name, :last_name, :email, :phone, :description)
    end

    def set_contact 
        @contact = current_user.contacts.find(params[:id])
    end
end
