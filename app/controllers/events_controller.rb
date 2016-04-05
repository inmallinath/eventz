require 'meetup'
class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :find_event, only: [:show, :edit, :update, :destroy]

  def index
    @city = City.find_by_id params[:city]
    puts @city
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

    @meetup_hash = Gmaps4rails.build_markers(@meetup_events) do |event, marker|
      marker.lat event['latitude']
      marker.lng event['longitude']
      marker.infowindow event['name']
      marker.picture({
                  :url => 'http://img1.meetupstatic.com/img/94156887029318281691566697/logo.svg',
                  :width   => 60,
                  :height  => 60
          })
    end
    render layout: 'event_index'
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new event_params
    if @event.save
      flash[:notice] = "Event Saved Successfully"
      redirect_to event_path(@event) # currently using calendar_path
    else
      flash[:alert] = "Event could not be saved"
      render :new
    end
  end

  def show

  end

  def edit

  end

  def update
    if @event.update event_params
      flash[:notice] = "Event Updated Successfully"
      redirect_to event_path(@event)
    else
      flash[:alert] = "Event Could not be Updated"
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path, notice: "Removed successfully"
  end
  private

  def find_event
    @event = Event.find params[:id]
  end

  def event_params
    params.require(:event).permit([:title, :description, :paid, :price, :event_on, :start, :end, :day_of_week, :event_data, :address_id, :event_category_id, :unit_id, :speaker_id])
  end
end
