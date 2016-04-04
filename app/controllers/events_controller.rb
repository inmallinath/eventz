class EventsController < ApplicationController
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

  private

  def event_params
    params.require(:event).permit([:title, :date])
  end
end
