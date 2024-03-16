class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:selected_flight])
    @booking = @flight.bookings.build
    @passenger_num = params[:selected_passenger_num].to_i
    @passenger_num.times { @booking.passengers.build }
  end

  def create
    @flight = Flight.find(params[:booking][:flight])
    @booking = @flight.bookings.build(booking_params)

    if @booking.save
      flash[:notice] = 'Booking completed ;)'
      redirect_to @flight
    else
      flash[:alert] = 'Problem when saving the booking'
      render :new, status: 422
    end
  end

  private

  def booking_params
    params.require(:booking).permit(passengers_attributes: %i[name email])
  end
end
