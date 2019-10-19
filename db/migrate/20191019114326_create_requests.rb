class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.integer :post_id
      t.integer :user_id
      t.string :comment

      t.timestamps
    end
  end
end
