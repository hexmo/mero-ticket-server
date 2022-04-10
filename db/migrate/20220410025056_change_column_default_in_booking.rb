class ChangeColumnDefaultInBooking < ActiveRecord::Migration[6.1]
  def change
    change_column_default :bookings, :seats, DEFAULT_SEAT_DATA
  end
end
