class Ticket < ApplicationRecord

    validates :name, presence: {message: 'ticket name is required'}, length: { minimum: 3, maximum: 50, message: "Ticket name must be greater than 3 characters" }
    validates :name, presence: {message: 'ticket description is required'}, length: { minimum: 3, maximum: 50, message: "Ticket description must be greater than 3 characters" }
    validates :payment_required, inclusion: {in: [true, false], message: 'please select if answer is either true or false'}
    validates :price, numericality: { greater_than_or_equal_to: 0, message: 'price must be greater than or equal to zero' }, if: ->(record) { record.price.present? }
    validates :max_capacity, numericality: { greater_than: 0, message: 'max_capacity must be greater than zero' }, if: ->(record) { record.max_capacity.present? }

    belongs_to :event
end
