class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:selected_flight])
    @booking = Booking.new
    @passenger_num = params[:selected_passenger_num].to_i
    @passenger_num.times { @booking.passengers.build }
  end

  def create
    @flight = Flight.find(params[:booking][:flight_id])
    @booking = @flight.bookings.build(booking_params)
    @passengers = @booking.passengers

    if @booking.save
      @passengers.each do |p|
        PassengerMailer.with(passenger: p).confirmation_email.deliver_now
      end

      flash[:notice] = 'Well done !'
      redirect_to @booking
    else
      flash[:alert] = 'Problem when saving the booking'
      render :new, status: 422
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @flight = Flight.find(@booking.flight_id)
    @passengers = @booking.passengers
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: %i[name email])
  end
end
