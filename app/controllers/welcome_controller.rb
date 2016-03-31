class WelcomeController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @countries = Country.all
    @states = State.where("country_id=?", Country.first.id)
    @cities = City.where("state_id=?", State.first.id)
  end

  def show
    @state = State.find_by("id = ?", params[:address][:state_id])
    @city = City.find_by("id = ?", params[:address][:city_id])
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
end
