# frozen_string_literal: true

class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: %i[show update destroy]

  # GET /bookings
  def index
    @bookings = Booking.joins(:vehicle).where(search_params).select('bookings.*, vehicles.*, bookings.id as booking_id')
    @bookings = @bookings.map do |booking|
      booking.as_json.merge({ remaining_seats: booking.remaining_seats })
    end

    render json: @bookings
  end

  # GET /bookings/1
  def show
    render json: @booking
  end

  # POST /bookings
  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      render json: @booking, status: :created, location: @booking
    else
      render json: @booking.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bookings/1
  def update
    if @booking.update(booking_params)
      render json: @booking
    else
      render json: @booking.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bookings/1
  def destroy
    @booking.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_booking
    @booking = Booking.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def booking_params
    params.require(:booking).permit(:vehicle_id, :start_location, :end_location, :eta, :journery_date, :journey_time,
                                    :seats)
  end

  def search_params
    params.permit(:start_location, :end_location, :journery_date)
  end
end
