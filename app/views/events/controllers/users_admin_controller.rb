class UsersAdminController < ApplicationController
  def update_role
    @user = current_user
    if @user.update_attribute(:role, params[:form_user][:role])
      flash[:notice] = "User updated Successfully"
      redirect_to new_event_path # currently using calendar_path
    else
      flash[:alert] = "Event could not be saved"
      render :nothing
    end
  end
end
