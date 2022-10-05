class Ticket < ApplicationRecord

    validates :name, presence: {message: 'ticket name is required'}, length: { minimum: 3, maximum: 50, message: "Ticket name must be greater than 3 characters" }
    validates :name, presence: {message: 'ticket description is required'}, length: { minimum: 3, maximum: 50, message: "Ticket description must be greater than 3 characters" }
    validates :payment_required, presence: {message: 'a ticket is either paid or free please select which applies'}
    validate :payment_required_field
    validates :price, numericality: { greater_than_or_equal_to: 0, message: 'price must be greater than or equal to zero' }, if: ->(record) { record.price.present? }
    validates :max_capacity, numericality: { greater_than: 0, message: 'max_capacity must be greater than zero' }, if: ->(record) { record.max_capacity.present? }

    belongs_to :event

    private

    def payment_required_field
        unless payment_required==true || payment_required==false || payment_required=="t" || payment_required=="f"
            errors.add(:payment_required, "payment required is either true or false")
        end
        if payment_required=="t" && price==0
            errors.add(:price, "please set price for ticket")
        end
        if payment_required=="f" && price>0
            errors.add(:price, "price should be equal to 0 if payment is not required")
        end
    end
end
