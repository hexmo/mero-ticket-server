class AddTicketPriceToBooking < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :ticket_price, :bigint
  end
end
