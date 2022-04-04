class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string   :room_name,      null: false
      t.text     :introduction,   null: false
      t.integer  :fee,            null: false
      t.string   :address,        null: false
      t.string   :room_image,     null: false
      t.integer  :user_id,        null: false

      t.timestamps
    end
  end
end
