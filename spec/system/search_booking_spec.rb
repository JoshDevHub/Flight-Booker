require "rails_helper"

RSpec.describe "Search a booking", type: :system do
  before do
    booking = create(:booking, :san_francisco_to_atlanta)
    create(:flight, :LGA_to_DEN)
    create(:passenger,
           first_name: "Josh",
           last_name: "Smith",
           email: "josh@email.com",
           booking: booking)
  end

  it "returns the flights the user is booked for" do
    visit bookings_path

    fill_in "passenger_email", with: "josh@email.com"
    click_on "Search"

    expect(page).to have_content("SFO")
  end

  it "does not return the flights the user is not booked for" do
    visit bookings_path

    fill_in "passenger_email", with: "josh@email.com"
    click_on "Search"

    expect(page).not_to have_content("DEN")
  end
end
