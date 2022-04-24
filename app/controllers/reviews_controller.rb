# frozen_string_literal: true

# revirew controller
class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_review, only: %i[show update destroy]

  # GET /reviews
  def index
    @reviews = Review.where(vehicle_id: params[:vehicle_id])

    render json: @reviews
  end

  # GET /reviews/1
  def show
    render json: @review
  end

  # POST /reviews
  def create
    @review = Review.new(review_params.merge(user_id: current_user.id))

    if @review.save
      render json: @review, status: :created, location: @review
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reviews/1
  def update
    if @review.update(review_params)
      render json: @review
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reviews/1
  def destroy
    @review.destroy
  end

  def review_present
    r_present = Review.where(user: current_user, vehicle_id: params[:vehicle_id]).take.present?

    render json: { reviewed: r_present }
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_review
    @review = Review.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def review_params
    params.require(:review).permit(:vehicle_id, :rating, :review)
  end
end
