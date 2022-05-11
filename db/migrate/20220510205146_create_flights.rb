class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.datetime :departure_time
      t.integer :flight_duration
      t.references :departure_airport, null: false, references: :airport
      t.references :arrival_airport, null: false, references: :airport

      t.timestamps
    end
  end
end
