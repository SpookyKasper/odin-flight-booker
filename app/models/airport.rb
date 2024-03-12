class Airport < ApplicationRecord
  validates :code, presence: true

  has_many :flight_departures, class_name: 'Flight', inverse_of: :departure_airport
  has_many :flight_arrivals, class_name: 'Flight', inverse_of: :arrival_airport
end
