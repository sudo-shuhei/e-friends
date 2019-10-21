class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :content
      t.integer :from_user_id
      t.integer :to_user_id
      t.string :room_id

      t.timestamps
    end
  end
end
