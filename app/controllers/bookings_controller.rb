class BookingsController < ApplicationController
  before_action :load_bookings, only: %i(index)
  before_action :logged_in_user, :check_session_room_id, only: :create

  def index; end

  def create
    @booking = current_user.bookings.build
    if Booking.create_booking @booking, params[:room_id],
                              checkin_param, checkout_param
      flash[:success] = t "controllers.bookings_controller.booking_successfull"
      redirect_to root_path
    else
      flash[:warning] = t "controllers.bookings_controller.booking_fail"
      redirect_to confirm_path
    end
  end

  private

  # before action

  def load_bookings
    @bookings = current_user.bookings.status_is filter_params[:status]
    @bookings = @bookings.pagination_at filter_params[:page]
    return if @bookings.any?

    flash.now[:warning] = t :empty
  end

  # param permit

  def filter_params
    params.permit(:page, :status)
  end

  def checkin_param
    session[params[:room_id]]["date_in"]
  end

  def checkout_param
    session[params[:room_id]]["date_out"]
  end

  def check_session_room_id
    return if session.keys.include? params[:room_id]

    flash[:danger] = t :not_found
    redirect_to root_path
  end
end
