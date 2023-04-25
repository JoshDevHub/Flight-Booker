namespace :db do
  desc "Update daily flight data"
  task update_daily_flights: :environment do
    delete_list = Flight.where(departure_time: Time.utc(2020)..Date.yesterday)

    delete_list.each do |flight|
      Flight.create!(
        flight_duration: rand(60..360),
        departure_time: 30.days.from_now,
        departure_airport: flight.departure_airport,
        arrival_airport: flight.arrival_airport
      )
    end

    delete_list.destroy_all
  end
end
