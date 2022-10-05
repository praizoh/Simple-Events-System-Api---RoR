class User < ApplicationRecord
    
    VALID_EMAIL_REGEX = /[a-z0-9-.-_]{2,}@[a-z0-9-.]{2,}\.[a-z]{2,}/i.freeze 

    before_save {self.email = email.downcase.strip}
    has_secure_password

    # Validations
    validates :email, format: { with: VALID_EMAIL_REGEX, message: "Enter a valid email" }, uniqueness: { case_sensitive: false, message: 'Email already exists'}
    validates :password, presence: {message: 'Password is required'}, length: { minimum: 8, maximum: 255, message: "Password must be at least 8 character" }, if: :password_required?
    validates :first_name, presence: {message: 'First name is required'}, length: { minimum: 3, maximum: 25, message: "First name must be greater than 3 characters" }
    validates :last_name, presence: {message: 'Last name is required'}, length: { minimum: 3, maximum: 25, message: "Last name must be greater than 3 characters" }

    has_many :events, dependent: :destroy
    
    def password_required?
        password.present?
    end

    def as_json(**options)
        # this coerces the option into an array and merges the passed
        # values with defaults
        excluding = [options[:exclude]].flatten
                                       .compact
                                       .union([:password_digest])
        super(options.merge(except: excluding))
    end
end
