module RoomsHelper
  # *_color function using to get bootstrap color
  def status_color room
    maps = {"available" => :success, "unavailable" => :danger}
    maps[room.status]
  end

  def level_color room
    maps =
      {
        "standard" => :info,
        "superior" => :success,
        "vip" => :warning,
        "luxury" => :danger
      }
    maps[room.level]
  end

  def room_image room
    image_tag(room.image, class: "card-img-top")
  end
end
