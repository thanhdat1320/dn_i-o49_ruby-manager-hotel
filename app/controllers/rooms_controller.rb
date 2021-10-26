class RoomsController < ApplicationController
  before_action :load_rooms, except: %i(show)
  before_action :load_room, only: %i(show)

  def index; end

  def show; end

  private

  def load_room
    @room = Room.find_by id: params[:id]
    return if @room

    flash[:danger] = t :not_found
    redirect_to root_path
  end

  def load_rooms
    # sort scope will add in another task
    @rooms = Room.page(params[:page]).per(Settings.digit.length_10)
    return if @rooms.any?

    flash[:danger] = t :empty_result
    redirect_to root_path
  end
end
