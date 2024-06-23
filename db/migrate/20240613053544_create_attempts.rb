class CreateAttempts < ActiveRecord::Migration[7.1]
  def change
    create_table :attempts do |t|
      t.references :room, null: false, foreign_key: true
      t.string :user_id
      t.text :guesses

      t.timestamps
    end
  end
end
