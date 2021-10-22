class Staff::BookingsController < ApplicationController
  before_action :load_bookings, only: %i(index)

  def index; end

  # before action

  def load_bookings
    @bookings = Booking.status_is filter_params[:status]
    return if @bookings.any?

    flash[:warning] = t :empty
  end

  # param permit

  def filter_params
    params.permit(:page, :status)
  end
end
