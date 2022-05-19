require "rails_helper"

RSpec.describe Flight, type: :model do
  describe "self::arriving_at" do
    context "when a flight is arriving in San Francisco" do
      let(:flight_arriving_san_francisco) do
        create(:flight, :arriving_san_francisco)
      end

      context "when the given code is San Francisco's airport code" do
        it "returns the Flights arriving at San Francisco" do
          san_francisco_code = "SFO"
          relation_obj = described_class.arriving_at(san_francisco_code)
          expect(relation_obj).to include(flight_arriving_san_francisco)
        end
      end

      context "when the given code is not San Francisco's airport code" do
        it "returns the Flights not including one landing in San Francisco" do
          denver_code = "DEN"
          relation_obj = described_class.arriving_at(denver_code)
          expect(relation_obj).not_to include(flight_arriving_san_francisco)
        end
      end
    end
  end

  describe "self::departing_from" do
    context "when the flight is departing from Atlanta" do
      let(:flight_departing_atlanta) do
        create(:flight, :departing_atlanta)
      end

      context "when the given code is Atlanta's airport code" do
        it "returns the Flight departing from Atlanta" do
          atlanta_code = "ATL"
          relation_obj = described_class.departing_from(atlanta_code)
          expect(relation_obj).to include(flight_departing_atlanta)
        end
      end

      context "when the given code is not Atlanta's airport code" do
        it "returns the flights not including the flight departing Atlanta" do
          denver_code = "DEN"
          relation_obj = described_class.departing_from(denver_code)
          expect(relation_obj).not_to include(flight_departing_atlanta)
        end
      end
    end
  end

  describe "#departure_date_formatted" do
    context "when the departure date is May 13, 2022" do
      subject(:may13_flight) { create(:flight, :departing_may132022) }

      it "formats the time to %m/%d/%Y" do
        formatted_date = may13_flight.departure_date_formatted
        expect(formatted_date).to eq("05/13/2022")
      end
    end

    context "when the departure date is October 5, 2023" do
      subject(:oct5_flight) { create(:flight, :departing_oct52023) }

      it "formats the time to %m/%d/%Y" do
        formatted_date = oct5_flight.departure_date_formatted
        expect(formatted_date).to eq("10/05/2023")
      end
    end
  end

  describe "#format_duration" do
    context "when the flight is 4 hours long" do
      subject(:flight_4h) { create(:flight, :four_hours_long) }

      it "formats the time to 4:00" do
        formatted_time = flight_4h.format_duration
        expect(formatted_time).to eq("4:00")
      end
    end

    context "when the flight is 2 hours and 11 minutes long" do
      subject(:flight_2h11m) { create(:flight, :two_hours_eleven_min) }

      it "formats the time to 2:11" do
        expected_format = "2:11"
        formatted_time = flight_2h11m.format_duration
        expect(formatted_time).to eq(expected_format)
      end
    end
  end
end
