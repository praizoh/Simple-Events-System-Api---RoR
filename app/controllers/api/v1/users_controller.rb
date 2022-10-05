class Api::V1::UsersController < ApplicationController
  skip_before_action :authorize_request, only: :create

  # REGISTER
  def create
    @user = User.create!(user_params)
    @auth_token = ::AuthenticateUser.new(@user.email, @user.password).call
    @response = { status: Status.created, message: Message.account_created, data:{user:@user, token:@auth_token} }
    json_response(@response, :created)
  end

  private

  def user_params
    params.permit(:email, :password, :first_name, :last_name)
  end

  # Handle validation errors
  rescue_from ActiveRecord::RecordInvalid do |exception|
    messages = exception.record.errors.messages
    @response = { status: Status.bad_request, message: Message.validation_failed, errors:messages}
    json_response(@response, :bad_request)
  end
end
