class RenameTypeColumnToNotifications < ActiveRecord::Migration[5.1]
  def change
    rename_column :notifications, :type, :message_type 
  end
end
