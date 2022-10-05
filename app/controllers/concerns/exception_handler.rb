module ExceptionHandler
    extend ActiveSupport::Concern
  
    # Define custom error subclasses - rescue catches `StandardErrors`
    class AuthenticationError < StandardError; end
    class MissingToken < StandardError; end
    class InvalidToken < StandardError; end
    class ExpiredSignature < StandardError; end
    class Unauthorized < StandardError; end
    class EventNotFound < StandardError; end
  
    included do
      # Define custom handlers
      rescue_from ActiveRecord::RecordInvalid, with: :four_twenty_two
      rescue_from ExceptionHandler::AuthenticationError, with: :invalid_credentials
      rescue_from ExceptionHandler::MissingToken, with: :four_zero_three
      rescue_from ExceptionHandler::InvalidToken, with: :four_twenty_two
      rescue_from ExceptionHandler::ExpiredSignature, with: :four_ninety_eight
      rescue_from ExceptionHandler::Unauthorized, with: :user_not_authorized
      rescue_from ExceptionHandler::EventNotFound, with: :event_not_found

      
      rescue_from ActiveRecord::RecordNotFound do |e|
        json_response({ status: Status.not_found, message: e.message }, :not_found)
      end
    end
  
    private
  
    # JSON response with message; Status code 401 - uauthorized
    def user_not_authorized(e)
      json_response({ status: Status.unauthorized, message: Message.user_not_authorized }, :unauthorized)
    end

    # JSON response with message; Status code 401 - uauthorized
    def four_twenty_two(e)
      json_response({ status: Status.unauthorized, message: e.message }, :unauthorized)
    end

    # JSON response with message; Status code 403 - Forbidden
    def four_zero_three(e)
      json_response({ status: Status.forbiden, message: e.message }, :unauthorized)
    end
  
    # JSON response with message; Status code 400 - Invalid credentials
    def invalid_credentials(e)
      json_response({status: Status.bad_request, message: e.message }, :bad_request)
    end

    # JSON response with message; Status code 498 - Expired Token
    def four_ninety_eight(e)
      json_response({ status:Status.expired_token, message: e.message }, :invalid_token)
    end
    def event_not_found
      render json: { status:400, message: 'Event not found' }, status: :not_found
    end
end