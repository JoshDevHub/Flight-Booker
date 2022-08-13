require "rails_helper"

RSpec.describe "Creating a booking", type: :system do
  before do
    create(:flight)
  end

  context "when the inputs are valid" do
    it "creates a new booking" do
      query_string = "?booking[flight_id]=1&booking[passenger_number]=1"
      attr_prefix = "booking[passengers_attributes][0]"

      visit "bookings/new#{query_string}"
      fill_in "#{attr_prefix}[first_name]", with: "Josh"
      fill_in "#{attr_prefix}[last_name]", with: "Smith"
      fill_in "#{attr_prefix}[email]", with: "josh@email.com"

      click_on "Book This Flight"
      expect(page).to have_content("Search Flights")
    end
  end

  context "when the inputs are invalid" do
    it "displays error messages" do
      query_string = "?booking[flight_id]=1&booking[passenger_number]=1"
      attr_prefix = "booking[passengers_attributes][0]"

      visit "bookings/new#{query_string}"
      fill_in "#{attr_prefix}[first_name]", with: ""
      fill_in "#{attr_prefix}[last_name]", with: "Smith"
      fill_in "#{attr_prefix}[email]", with: "josh@email.com"

      # click_on "Book This Flight"
      empty_field = find(:field, "#{attr_prefix}[first_name]")

      click_on "Book This Flight"
      expect(find(:field, valid: false)).to eq empty_field
      # field = find(:field, valid: false)
      # p field
      # expect("#{attr_prefix}[first_name]".valid).to be_false
      # expect(page.all(:field, "#{attr_prefix}[first_name]").valid).to be_false
      # expect(page).to have_content("first name can't be blank")
    end
  end
end
