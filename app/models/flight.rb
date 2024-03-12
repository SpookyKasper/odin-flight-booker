class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'

  def flight_date_formatted
    start.strftime("%Y.%m.%d")
  end
end
