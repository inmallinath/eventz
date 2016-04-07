require 'meetup'
class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:city]
  before_action :find_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def city
    @city = City.find_by_id params[:city]
    # puts @city
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
    render layout: 'city_events'
  end

  def index_calendar
    @events = Event.all
  end

  def new
    @event = Event.new
    @event.build_address
    @countries = Country.all
    @states = State.where("country_id=?", Country.first.id)
    @cities = City.where("metro=? and state_id=? ", true, State.first.id)
  end

  def create
    @event = Event.new event_params
    respond_to do |format|
      if @event.save
        # byebug
        summary = event_params['title']
        description = event_params['description']
        address = event_params['address_attributes']['description']
        zip = event_params['address_attributes']['zip']
        country = Country.find_by_id(event_params['address_attributes']['country_id']).description
        state = State.find_by_id(event_params['address_attributes']['state_id']).code
        city = City.find_by_id(event_params['address_attributes']['city_id']).code
        # byebug
        startdate = event_params[:event_on].to_datetime
        starttime = event_params[:start].to_time
        gstart = DateTime.new
        gstart = startdate.change({hour: starttime.hour, min: starttime.min})
        enddate = event_params[:event_on].to_datetime
        endtime = event_params[:end].to_time
        gend = DateTime.new
        gend = enddate.change({hour: starttime.hour, min: starttime.min})

        @google_event = {
          'summary' => summary,
          'description' => description,
          'location' => location,
          'start' => {'dateTime' => gstart},
          'end' => {'dateTime' => gend},
          'attendees' => [ { "email" => 'inmallinath@hotmail.com' } ]
        }

        client = Google::APIClient.new

        client.authorization.access_token = current_user.identities.first.accesstoken
        service = client.discovered_api('calendar', 'v3')
        @set_event = client.execute(:api_method => service.events.insert,
                            :parameters => {'calendarId' => current_user.email, 'sendNotifications' => true},
                            :body => JSON.dump(@google_event),
                            :headers => {'Content-Type' => 'application/json'})
        format.html { redirect_to event_path(@event), notice: "Event Saved Successfully"}
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def show

  end

  def edit
    @event.address || @event.build_address
    @countries = [@event.address.country].compact
    @states = [@event.address.state].compact
    @cities = [@event.address.city].compact

  end

  def user_events

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

  def update
    respond_to do |format|
      if @event.update event_params
        format.html { redirect_to event_path(@event), notice: "Event Updated Successfully" }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_path, notice: "Removed successfully"}
      format.json { head :no_content }
    end
  end

  private

  def find_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description, :paid, :price, :event_on, :start, :end, :day_of_week, :event_data, :address_id, :event_category_id, :unit_id, :speaker_id, :address_attributes => [:description, :zip, :country_id, :state_id, :city_id, :id, :_destroy])
    # params.require(:event).permit(:title, :description, :paid, :price, :event_on, :start, :end, :day_of_week, :event_data, :address_id, :event_category_id, :unit_id, :speaker_id, :address_attributes => ["description", "zip", "country_id", "state_id", "city_id", "id", "_destroy"])

  end
end
