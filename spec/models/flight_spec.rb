require 'rails_helper'

RSpec.describe Flight, type: :model do
  describe "self.arriving_at" do
    context "when the flight is arriving in San Francisco" do
      let(:flight_arriving_san_francisco) do
        create(:flight, :arriving_san_francisco)
      end

      context "when the given code is San Francisco's Airport code" do
        it "returns the Flights arriving at San Francisco" do
          san_francisco_code = "SFO"
          relation_obj = Flight.arriving_at(san_francisco_code)
          expect(relation_obj).to include(flight_arriving_san_francisco)
        end
      end

      context "when the given code is not San Francisco's Airport code" do
        it "returns the Flights not including one landing in San Francisco" do
          denver_code = "DEN"
          relation_obj = Flight.arriving_at(denver_code)
          expect(relation_obj).to_not include(flight_arriving_san_francisco)
        end
      end
    end
  end

  describe "self.departing_from" do
    xit "returns the Flights departing from the given airport code" do
      # placeholder
    end
  end
end
