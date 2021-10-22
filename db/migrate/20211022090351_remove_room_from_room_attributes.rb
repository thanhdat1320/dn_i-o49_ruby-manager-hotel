class RemoveRoomFromRoomAttributes < ActiveRecord::Migration[6.1]
  def change
    remove_column :room_attributes, :room_id
  end
end
