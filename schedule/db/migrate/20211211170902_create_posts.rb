class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.date :start_day, null: false
      t.date :end_day, null: false
      t.boolean :allday, default: false, null: false
      t.text :memo

      t.timestamps
    end
  end
end
