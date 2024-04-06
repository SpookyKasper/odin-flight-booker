class PassengersController < ApplicationController
  def new
    @passenger = Passenger.new
  end

  private

  def passenger_params
    params.require(:passenger).permit(:name, :email)
  end
end
