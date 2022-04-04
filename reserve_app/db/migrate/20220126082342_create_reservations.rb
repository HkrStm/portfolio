class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.integer  :number_reservations,   null: false
      t.datetime :check_in,              null: false
      t.datetime :check_out,             null: false
      t.integer  :user_id,               null: false
      t.integer  :room_id,               null: false
      t.string   :username,              null: false
      t.string   :room_name,             null: false

      t.timestamps
    end
  end
end
