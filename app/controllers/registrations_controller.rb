class RegistrationsController < Devise::RegistrationsController
  def update_resource(resource, params)
    if resource.encrypted_password.blank? # || params[:password].blank?
      resource.email = params[:email] if params[:email]
      if !params[:password].blank? && params[:password] == params[:password_confirmation]
        logger.info "Updating password"
        resource.password = params[:password]
        resource.save
      end
      if resource.valid?
        resource.update_without_password(params)
      end
    else
      resource.update_with_password(params)
    end
  end
  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :role, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :role, :email, :password, :password_confirmation, :current_password)
  end

  protected
  def after_sign_up_path_for(resource)
    if current_user.host?
      '/organizations/' # Or :prefix_to_your_route
    elsif current_user.user?
      # user_events_event_path
      events_path
    end
  end
end
