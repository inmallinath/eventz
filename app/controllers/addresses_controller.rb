class AddressesController < ApplicationController
before_action :authenticate_user!

  def new
    @address = Address.new
  end

  def index
    @addresses = Address.order("created_at DESC")
    @countries = Country.all
    @states = State.where("country_id=?", Country.first.id)
    @cities = City.where("state_id=?", State.first.id)
  end

  def update_states
    @states = State.where("country_id=?", params[:country_id])
    respond_to do |format|
      format.js
    end
  end

  def update_cities
    @cities = City.where("state_id=?", params[:state_id]).order("code ASC")
    respond_to do |format|
      format.js
    end
  end

  def show
  end

  def create
    @address = Address.new address_params
    if @address.save
      flash[:notice] = "Saved Successfully"
      redirect_to address_path(@address)
    else
      flash[:alert] = "Could not be saved"
      render :new
    end
  end

  private

  def find_address
    @address = Address.find params[:id]
  end

  def address_params
    params.require(:address).permit([:description, :zip])
  end
end
