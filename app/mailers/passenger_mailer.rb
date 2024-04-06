class PassengerMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def confirmation_email
    @passenger = params[:passenger]
    @email = @passenger.email
    @url = 'https://localhost:3000'
    mail(to: @email, subject: 'Your booking Was Created!')
  end
end
