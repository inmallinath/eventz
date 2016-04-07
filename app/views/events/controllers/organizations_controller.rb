class OrganizationsController < ApplicationController
before_action :authenticate_user! # add user_role filter here
before_action :find_organization, only: [:show, :edit, :update, :destroy]

  def index
    @organizations = Organization.order("created_at DESC")
  end

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new organization_params
    if @organization.save
      flash[:notice] = "Saved Successfully"
      redirect_to organization_path(@organization)
    else
      flash[:alert] = "Could not be saved"
      render :new
    end
  end

  def edit
  end

  def update
    if @organization.update organization_params
      flash[:notice] = "Updated Successfully"
      redirect_to organization_path(@organization)
    else
      flash[:alert] = "Could not be Updated"
      render :edit
    end
  end

  def destroy
    @organization.destroy
    redirect_to _path, notice: "Removed successfully"
  end

  private

  def find_organization
    @organization = Organization.find params[:id]
  end

  def organization_params
    params.require(:organization).permit([:code, :description, :url, :logo, :representative_id, :location])
  end
end
