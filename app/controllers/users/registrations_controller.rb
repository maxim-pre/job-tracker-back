class Users::RegistrationsController < Devise::RegistrationsController
  include RackSessionFix
  respond_to :json
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  def respond_with(resource, _opts = {})
    if request.method == "POST" && resource.persisted?
      render json: {
        status: { code: 200, message: "Signed up successfully." },
        data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
      }, status: :ok
    elsif request.method == "DELETE"
      render json: {
        status: { code: 200, message: "Account deleted successfully." }
      }, status: :ok
    elsif request.method == "PATCH" && resource.persisted?
      if update_user_without_password(resource, account_update_params)
        render json: {
          status: { code: 200, message: "Account updated successfully." },
          data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
        }, status: :ok
      else
        render json: {
          status: { code: 422, message: "User couldn't be updated successfully. #{resource.errors.full_messages.to_sentence}", errors: resource.errors }
        }, status: :unprocessable_entity
      end
    else
      render json: {
        status: { code: 422, message: "User couldn't be created successfully. #{resource.errors.full_messages.to_sentence}", errors: resource.errors }
      }, status: :unprocessable_entity
    end
  end

  private

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :target_title, :salary_min, :salary_max])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :target_title, :salary_min, :salary_max, :application_goal])
  end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def bypass_sign_in(resource, scope=nil)
     
  end

  def update_user_without_password(resource, params)
    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
      resource.update_without_password(params)
    else
      resource.update(params)
    end
  end
end