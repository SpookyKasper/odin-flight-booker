class FlightsController < ApplicationController
  def index
    @airports = Airport.all
    @airport_options = Airport.pluck(:code, :id)
    @flights = Flight.all
    @passenger_num_options = (1..4).to_a
    @departure_dates = Flight.pluck(:start).map { |dt| datetime_to_date(dt) }
  end

  def show
  end

  private

  def datetime_to_date(date)
    date.strftime("%Y.%m.%d")
  end
end
