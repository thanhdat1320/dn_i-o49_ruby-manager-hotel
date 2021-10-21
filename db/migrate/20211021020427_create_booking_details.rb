class CreateBookingDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :booking_details do |t|
      t.date :date_in
      t.date :date_out
      t.integer :days_range
      t.references :room, null: false, foreign_key: true
      t.references :booking, null: false, foreign_key: true

      t.timestamps
    end
  end
end
