class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'
  has_many :bookings
  has_many :passengers, through: :bookings

  def flight_date_formatted
    start.strftime("%Y.%m.%d")
  end
end
