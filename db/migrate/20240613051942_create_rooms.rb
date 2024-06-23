class CreateRooms < ActiveRecord::Migration[7.1]
  def change
    create_table :rooms do |t|
      t.string :roomID
      t.string :word
      t.integer :result

      t.timestamps
    end
  end
end
