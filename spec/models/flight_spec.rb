require 'rails_helper'

RSpec.describe Flight, type: :model do
  describe "self::arriving_at" do
    context "when the flight is arriving in San Francisco" do
      let(:flight_arriving_san_francisco) do
        create(:flight, :arriving_san_francisco)
      end

      context "when the given code is San Francisco's airport code" do
        it "returns the Flights arriving at San Francisco" do
          san_francisco_code = "SFO"
          relation_obj = Flight.arriving_at(san_francisco_code)
          expect(relation_obj).to include(flight_arriving_san_francisco)
        end
      end

      context "when the given code is not San Francisco's airport code" do
        it "returns the Flights not including one landing in San Francisco" do
          denver_code = "DEN"
          relation_obj = Flight.arriving_at(denver_code)
          expect(relation_obj).to_not include(flight_arriving_san_francisco)
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
          relation_obj = Flight.departing_from(atlanta_code)
          expect(relation_obj).to include(flight_departing_atlanta)
        end
      end

      context "when the given code is not Atlanta's airport code" do
        it "returns the flights not including the flight departing Atlanta" do
          denver_code = "DEN"
          relation_obj = Flight.departing_from(denver_code)
          expect(relation_obj).to_not include(flight_departing_atlanta)
        end
      end
    end
  end
end
