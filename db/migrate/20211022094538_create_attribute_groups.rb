class CreateAttributeGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :room_attribute_groups do |t|
      t.references :room, null: false, foreign_key: true
      t.references :room_attribute, null: false, foreign_key: true

      t.timestamps
    end
  end
end
