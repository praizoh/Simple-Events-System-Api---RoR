class Api::V1::AuthenticationsController < ApplicationController

  skip_before_action :authorize_request, only: :create

  # return auth token once user is authenticated
  def create
    @user = User.find_by(email: auth_params[:email].downcase.strip)
    @auth_token =
    AuthenticateUser.new(auth_params[:email].downcase.strip, auth_params[:password]).call
    @response = { status: Status.success, message: Message.account_login, data:{ user:@user, token:@auth_token } }
    json_response(@response, :ok)
  end

  private

  def auth_params
    params.require(:authentication).permit(:email, :password)
  end

end
