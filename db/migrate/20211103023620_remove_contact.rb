class RemoveContact < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :contact_id
    remove_column :bookings , :contact_id
  end
end
