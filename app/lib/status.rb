class Status
    def self.success
        200 
    end

    def self.unauthorized
        401 
    end

    def self.bad_request
        400
    end

    def self.created
        201
    end

    def self.not_found
        404
    end

    def self.expired_token
        404
    end
    
    def self.forbiden
        403
    end
end