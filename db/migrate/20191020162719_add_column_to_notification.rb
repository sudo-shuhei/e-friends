class AddColumnToNotification < ActiveRecord::Migration[5.1]
  def change
    add_column :notifications, :post_id, :integer
    add_column :notifications, :post_user_id, :integer 
  end
end
