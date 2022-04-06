class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :vehicle, null: false, foreign_key: true
      t.string :start_location
      t.string :end_location
      t.integer :eta
      t.date :journery_date
      t.time :journey_time
      t.jsonb :seats

      t.timestamps
    end
  end
end
