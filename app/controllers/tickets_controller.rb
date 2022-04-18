# frozen_string_literal: true

# ticket controller
class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket, only: [:destroy]

  # GET /tickets
  def index
    @tickets = Ticket.all

    render json: @tickets
  end

  # POST /tickets
  def create
    @ticket = Ticket.new(ticket_params.merge({ user_id: current_user.id }))

    if @ticket.save
      update_booked(@ticket.booking, @ticket.seats)

      render json: @ticket, status: :created, location: @ticket
    else
      render json: @ticket.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tickets/1
  def destroy
    @ticket.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def ticket_params
    params.require(:ticket).permit(:seats, :total_price, :passenger_name, :passenger_contact, :booking_id)
  end

  def update_booked(booking, seats)
    booked_seats = seats.split(',')
    bus_seats = booking.seats.map do |seat|
      { 'id' => seat['id'], 'booked' => booked_seats.include?(seat['id']) || seat['booked'] }
    end
    booking.update(seats: bus_seats)
  end
end
