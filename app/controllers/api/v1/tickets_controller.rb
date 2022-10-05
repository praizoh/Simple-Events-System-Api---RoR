class Api::V1::TicketsController < ApplicationController
  def create
    @user = current_user
    @event = Event.find_by_id(params[:id])
    raise(ExceptionHandler::EventNotFound)  unless @event
    raise(ExceptionHandler::Unauthorized) unless @event[:user_id] == @user[:id]
    @ticket = Ticket.create!(ticket_params.merge(event_id: params[:id]))
    @response = { status: Status.success, message: Message.ticket_created, data:{ticket:@ticket} }
    json_response(@response, :ok)
  end

  def index
    @user = current_user
    @event = Event.find_by_id(params[:id])
    raise(ExceptionHandler::EventNotFound)  unless @event
    raise(ExceptionHandler::Unauthorized) unless @event[:user_id] == @user[:id]
    @tickets = Ticket.where(event_id: params[:id]).order(created_at: :asc)
    @response = { status: Status.success, message: Message.ticket_fetched, data:@tickets }
    json_response(@response, :ok)
  end
  private
    
  def ticket_params
    params.permit(:name, :description, :payment_required, :price, :max_capacity)
  end

  # Handle validation errors
  rescue_from ActiveRecord::RecordInvalid do |exception|
    messages = exception.record.errors.messages
    @response = { status: Status.bad_request, message: Message.validation_failed, errors:messages}
    json_response(@response, :bad_request)
  end
end
