class RoomAttributeGroup < ApplicationRecord
  belongs_to :room
  belongs_to :room_attribute
end
