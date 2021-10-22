class ChangeFieldTypeForRoom < ActiveRecord::Migration[6.1]
  def change
    rename_column :rooms, :type, :level
    add_column :rooms, :name, :string
  end
end
