class RoomAttribute < ApplicationRecord
  has_many :room_attribute_groups, dependent: :destroy
  has_many :rooms, through: :room_attribute_groups
end
