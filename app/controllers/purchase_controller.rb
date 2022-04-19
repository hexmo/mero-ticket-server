# frozen_string_literal: true

# upcoming and previous tickets
class PurchaseController < ApplicationController
  before_action :authenticate_user!

  # GET /booked_tickets
  def booked_tickets
    @bookings = current_user.tickets

    render json: @bookings.as_json
  end

  # GET /expired_tickets
  def expired_tickets
    @bookings = current_user.tickets

    render json: @bookings
  end
end
