class AddressesController < ApplicationController
before_action :authenticate_user!

  def new
    @address = Address.new
    @countries = Country.all
    @states = State.where("country_id=?", Country.first.id)
    @cities = City.where("metro=? and state_id=? ", true, State.first.id)
    # puts current_user.full_name
  end

  def index
    # @addresses = Address.order("created_at DESC")
    # @countries = Country.all
  end

  def update_states
    @states = State.where("country_id=?", params[:country_id])
    respond_to do |format|
      format.js
    end
  end

  def update_cities
    @cities = City.where("metro=? and state_id=?", true, params[:state_id]).order("code ASC")
    respond_to do |format|
      format.js
    end
  end

  def show
  end

  def create
    @address = Address.new address_params
    if @address.save
        # @identity = current_user.identities.first
        # puts "<<<<<<<<<<<<<<<<<<<<<<<<"
        # puts current_user.email
        # puts @identity[:email]
        # puts ">>>>>>>>>>>>>>>>>>>>>>>>"
        # @identity.address = @address
        # @identity.save
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
    params.require(:address).permit([:description, :zip, :city_id, :state_id, :country_id])
  end
end