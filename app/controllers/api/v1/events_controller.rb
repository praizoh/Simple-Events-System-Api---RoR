class Api::V1::EventsController < ApplicationController
  def create
    @user = current_user
    @event = Event.create!(event_params.merge(user_id: @user[:id]))
    @response = { status: Status.success, message: Message.event_created, data:{event:@event} }
    json_response(@response, :ok)
  end

  def index
    @events = Event.all
    @response = { status: Status.success, message: Message.event_fetched, data:{events:@events} }
    json_response(@response, :ok)
  end

  def show
    event = Event.find_by(id: params[:id])
    if event 
      @response = { status: Status.success, message: Message.event_fetched, data:{event:event, tickets:event.tickets} }
      json_response(@response, :ok)
    else 
      @response = { status: Status.bad_request, message: Message.event_does_not_exist }
      json_response(@response, :bad_request)
    end
  end

  def update
    @user = current_user
    user_id = @user[:id]
    @event = Event.find_by_id(params[:id])
    raise(ExceptionHandler::EventNotFound)  unless @event
    raise(ExceptionHandler::Unauthorized) unless @event[:user_id] == @user[:id]
    @event.update!(update_event_params)
    @response = { status: Status.success, message: Message.event_updated, data:{ event:@event } }
    json_response(@response, :ok)
  end

  def getMyEvents
    @user = current_user
    @events = Event.where(user_id: @user[:id]).order(created_at: :asc)
    @response = { status: Status.success, message: Message.event_fetched, data:@events }
    json_response(@response, :ok)
  end

  private
    
  def event_params
    params.permit(:name, :description, :start_date, :end_date, :time_zone, :event_link)
  end
  def update_event_params
    params.permit(:name, :description, :start_date, :end_date, :time_zone, :event_link)
  end

  # Handle validation errors
  rescue_from ActiveRecord::RecordInvalid do |exception|
    messages = exception.record.errors.messages
    @response = { status: Status.bad_request, message: Message.validation_failed, errors:messages}
    json_response(@response, :bad_request)
  end
end
