class Staff::RoomsController < ApplicationController
  before_action :load_rooms, only: %i(index)
  def index; end

  def load_rooms
    @rooms = Room.pagination_at(filter_params[:page])
    return if @rooms.any?

    flash.now[:danger] = t :empty
  end

  # params permit

  def filter_params
    params.permit(:page)
  end
end
