class Message
    def self.not_found(record = 'record')
      "Sorry, #{record} not found."
    end

    def self.invalid_credentials
      'Email or password incorrect'
    end
  
    def self.invalid_token
      'Invalid token'
    end

    def self.password_same_as_old
      'New password and old password cannot be the same'
    end
  
    def self.missing_token
      'Missing token'
    end
  
    def self.unauthorized
      'Unauthorized request'
    end
  
    def self.account_created
      'Account created successfully'
    end
  
    def self.account_not_created
      'Account could not be created'
    end
  
    def self.expired_token
      'Sorry, your token has expired. Please login to continue.'
    end

    def self.account_login
      'You logged in successfully'
    end

    def self.profile_updated
      'Profile updated successfully'
    end

    def self.profile_not_updated
      'Profile update was unsuccessfull'
    end

    def self.profile_fetched
      'Profile fetched successfully'
    end

    def self.validation_failed
      'Validation failed'
    end

    def self.user_does_not_exist
      'User account not found'
    end

    def self.supply_required_parameters
      'Enter all required parameters'
    end
    
    def self.user_not_authorized
      'User not authorised to access this resource'
    end

    def self.event_created
      'Event created successfully'
    end

    def self.event_fetched
      'Event(s) fetched successfully'
    end
    def self.event_does_not_exist
      'Event(s) fetched successfully'
    end
    def self.event_updated
      'Event(s) updated successfully'
    end

    def self.ticket_created
      'Ticket created successfully'
    end
    def self.ticket_fetched
      'Ticket(s) fetched successfully'
    end
 end