class PassengerMailer < ApplicationMailer
  default from: "notifications@example.com"

  def confirmation_email
    @passenger = params[:passenger]
    @url = "https://cryptic-dawn-66962.herokuapp.com/"
    mail(to: @passenger.email, subject: "Flight Booking Confirmation")
  end
end
