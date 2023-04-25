require "rails_helper"
require "rake"

describe ":db", type: :task do
  before do
    Rake.application.rake_require "tasks/update_daily_flights"
    Rake::Task.define_task(:environment)
  end

  describe "db:update_daily_flights" do
    let(:update_daily_flights) do
      Rake::Task["db:update_daily_flights"].reenable

      Rake.application.invoke_task "db:update_daily_flights"
    end

    context "with an out of date flight" do
      let!(:out_of_date_flight) { create(:flight, :departing_may242022) }

      it "destroys the out of date flight" do
        update_daily_flights

        expect(Flight.all).not_to include(out_of_date_flight)
      end

      it "generates a new flight with a departure time 30 days in the future" do
        expected_depart_date = (Time.now.utc + 30.days).to_date
        update_daily_flights

        expect(Flight.first.departure_time.to_date).to eq expected_depart_date
      end
    end

    context "with an in date flight" do
      let!(:in_date_flight) { create(:flight, departure_time: Date.tomorrow) }

      it "does nothing" do
        update_daily_flights

        expect(Flight.last).to eq in_date_flight
      end
    end
  end
end
