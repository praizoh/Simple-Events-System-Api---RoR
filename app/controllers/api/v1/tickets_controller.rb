class Api::V1::TicketsController < ApplicationController
  def create
    @user = current_user
    @ticket = Ticket.create!(ticket_params.merge(user_id: @user[:id]))
    @response = { status: Status.success, message: Message.ticket_created, data:{ticket:@ticket} }
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
