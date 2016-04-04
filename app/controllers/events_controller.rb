require 'meetup'
class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @city = City.find_by_id params[:city]
    @events = @city.events

    @map_hash = Gmaps4rails.build_markers(@events) do |event, marker|
      marker.lat event.address.latitude
      marker.lng event.address.longitude
      marker.infowindow event.title
    end

    # MEETUP EVENTS LISTING
    @city_name = @city.code
    meetup_city = Meetup.new(ENV['MeetupKeyId'])
    # ap meetups.events(query: {city: @city_name})
    meetup_list = meetup_city.events(query: {city: @city_name})

    @meetup_events = meetup_list['results'].map do |event|
    if event['venue'] != nil
      {
        "name" => event["name"],
        "location" => event["venue"]["name"],
        "latitude" => event["venue"]["lat"],
        "longitude" => event["venue"]["lon"],
        # "date" => DateTime.strptime(event["time"], "%s")
      }
      end
    end
    # compact deletes all the nil records
    @meetup_events = @meetup_events.compact
    ap @meetup_events
    render layout: 'event_index'
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new event_params
    if @event.save
      flash[:notice] = "Saved Successfully"
      redirect_to calendar_path()
    else
      flash[:alert] = "Event could not be saved"
      render :new
    end
  end

  def show
    @event = Event.find params[:id]
  end
  private

  def event_params
    params.require(:event).permit([:title, :date])
  end
end
