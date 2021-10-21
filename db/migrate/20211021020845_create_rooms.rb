class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :image
      t.integer :price
      t.integer :type, null: false, default: 0
      t.integer :status, null: false, default: 0
      t.string :description

      t.timestamps
    end
  end
end
