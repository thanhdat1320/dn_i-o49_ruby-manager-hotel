class RoomsController < ApplicationController
  before_action :load_rooms

  def index; end

  private

  def load_rooms
    # sort scope will add in another task
    @rooms = Room.page(params[:page]).per(Settings.digit.length_10)
    return if @rooms.any?

    flash[:danger] = t :empty_result
    redirect_to root_path
  end
end
