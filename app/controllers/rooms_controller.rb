class RoomsController < ApplicationController
  before_action :load_rooms, except: %i(show)
  before_action :load_room, only: %i(show)

  def index
    @attributes = RoomAttribute.pluck(:name, :id)
  end

  def show; end

  private

  def load_room
    @room = Room.find_by id: params[:id]
    return if @room

    flash[:danger] = t :not_found
    redirect_to root_path
  end

  def load_rooms
    @rooms = Room.room_filter room_params
    flash.now[:danger] = t :empty_result unless @rooms.any?
  end

  def room_params
    params.permit(:sort, :keyword, :page, :locale, attributes: [])
  end
end
