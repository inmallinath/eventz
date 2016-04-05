class UserEventsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :find_user_event, only: [:show, :edit, :update, :destroy]

  def index
    @userevents = UserEvent.order("created_at DESC")
  end

  def new
    @userevent = UserEvent.new
  end

  def create
    @userevent = UserEvent.new user_event_params
    if @userevent.save
      flash[:notice] = "User Event Saved Successfully"
      redirect_to user_event_path()
    else
      flash[:alert] = "User Event could not be saved"
      render :new
    end
  end

  def edit
  end

  def update
    if @userevent.update user_event_params
      flash[:notice] = "User Event updated successfully"
      redirect_to _path()
    else
      flash[:alert] = "User Event could not be Updated"
      render :edit
    end
  end

  def def destroy
    @userevent.destroy
    redirect_to _path, notice: "User Event Removed successfully"
  end

  private

  def find_user_event
    @userevent = UserEvent.find params[:id]
  end

  def user_event_params
    params.require(:user_event).permit([:user_id, :event_id, :stripe_txn_id, :stripe_customer_id, :stripe_last_4, :stripe_card_expiry ])
  end
end
