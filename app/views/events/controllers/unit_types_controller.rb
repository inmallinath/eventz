class UnitTypesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_unit_type, only: [:show, :edit, :update, :destroy]

  def index
    @unit_types = UnitType.order("created_at DESC")
  end

  def new
    @unit_type = UnitType.new
  end

  def create
    @unit_type = UnitType.new unit_type_params
    if @unit_type.save
      flash[:notice] = "Unit Type Saved Successfully"
      redirect_to unit_type_path(@unit_type)
    else
      flash[:alert] = "Unit Type could not be saved"
      render :new
    end
  end

  def edit

  end

  def update
    if @unit_type.update unit_type_params
      flash[:notice] = "Unit Type updated Successfully"
      redirect_to unit_type_path(@unit_type)
    else
      flash[:alert] = "Unit Type could not be Updated"
      render :edit
    end
  end

  def destroy
    @unit_type.destroy
    redirect_to unit_types_path, notice: "Unit Type Removed successfully"
  end

  private

  def find_unit_type
    @unit_type = UnitType.find params[:id]
  end

  def unit_type_params
    params.require(:unit_type).permit([:code, :description])
  end
end
