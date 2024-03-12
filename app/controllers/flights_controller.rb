class FlightsController < ApplicationController
  def index
    @airport_options = Airport.pluck(:code, :id)
    @passenger_num_options = (1..4).to_a
    @flights = Flight.all
    @available_flights = Flight.where(
      departure_airport_id: params[:departure_airport],
      arrival_airport_id: params[:arrival_airport]
    )
    @selected_passenger_num = params[:passenger_num]
    @available_flights_options = @available_flights.map { |af| [af.start.strftime("%Hh%m"), af.id] }
  end

  def show
  end

end
