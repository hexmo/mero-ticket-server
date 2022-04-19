# frozen_string_literal: true

# upcoming and previous tickets
class PurchaseController < ApplicationController
  before_action :authenticate_user!

  # GET /booked_tickets
  def booked_tickets
    @bookings = []

    current_user.tickets.each do |ticket|
      if ticket.booking.journery_date > 1.days.ago
        @bookings.push({ ticket: ticket, booking: ticket&.booking, vehicle: ticket&.booking&.vehicle })
      end
    end

    render json: @bookings
  end

  # GET /expired_tickets
  def expired_tickets
    @bookings = []

    current_user.tickets.each do |ticket|
      if ticket.booking.journery_date < 1.days.ago
        @bookings.push({ ticket: ticket, booking: ticket&.booking, vehicle: ticket&.booking&.vehicle })
      end
    end

    render json: @bookings
  end
end
