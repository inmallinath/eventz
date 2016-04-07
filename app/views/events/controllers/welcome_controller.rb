class WelcomeController < ApplicationController

  def index
    @cities = City.order("code DESC").where("metro=true")
  end

  def show
    # @state = State.find_by("id = ?", params[:address][:state_id])
    # @city = City.find_by("id = ?", params[:address][:city_id])
  end

  def index_oauth
  end
end
