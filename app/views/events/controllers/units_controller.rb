class UnitsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_unit, only: [:show, :edit, :update, :destroy]

  def index
    @units = Unit.order("created_at DESC")
  end

  def new
    @unit = Unit.new
  end

  def create
    @unit = Unit.new unit_params
    if @unit.save
      flash[:notice] = "Unit Saved Successfully"
      redirect_to unit_path(@unit)
    else
      flash[:alert] = "Unit could not be saved"
      render :new
    end
  end

  def edit

  end

  def update
    if @unit.update unit_params
      flash[:notice] = "Unit Updated Successfully"
      redirect_to unit_path(@unit)
    else
      flash[:alert] = "Unit could not be Updated"
      render :edit
    end
  end

  def destroy
    @unit.destroy
    redirect_to @units_path, notice: "Unit Removed successfully"
  end

  private

  def find_unit
    @unit = Unit.find params[:id]
  end

  def unit_params
    params.require(:unit).permit([:code, :description, :capacity, :unit_type_id])
  end
end
