class PassengerMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def confirmation_email
    @booking = params[:booking]
    @passengers = @booking.passengers
    @mail = @passengers.first.email
    @url = 'https://localhost:3000'
    mail(to: @mail, subject: 'Your booking Was Created!')
  end
end
