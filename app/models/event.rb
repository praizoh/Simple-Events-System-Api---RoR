class Event < ApplicationRecord

    TIME_ZONES = %w[WAT CEST].freeze

    validates :name, presence: {message: 'event name is required'}, length: { minimum: 3, maximum: 50, message: "Event name must be greater than 3 characters" }

    validates :description, presence: {message: 'description is required'}, length: { minimum: 3, maximum: 50, message: "Description must be greater than 3 characters" }

    validates :start_date, presence: {message: 'start date is required'}, 
        numericality: {
            only_integer: true,
            greater_than_or_equal_to: Date.current.year,
            message: 'start date cannot be less than now'
        }

    validates :end_date, presence: {message: 'end date is required'}, 
        numericality: {
            only_integer: true,
            greater_than_or_equal_to: Date.current.year,
            message: 'end date cannot be less than now'
        }

    validates :time_zone, presence: { message: 'timezone is required'}, inclusion: {in: TIME_ZONES, message: 'enter a valid timezone' }

    validates :event_link, presence: {message: 'event link is required'}, format: { with: URI.regexp, message: 'enter a valid url'}, if: ->(record) { record.event_link.present? }

    validate :end_date_after_start_date

    belongs_to :user
    has_many :tickets

    private

    def end_date_after_start_date
        return if end_date.blank? || start_date.blank?

        if end_date < start_date
            errors.add(:end_date, "must be after the start date")
        end
    end
end
