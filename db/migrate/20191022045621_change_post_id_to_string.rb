class ChangePostIdToString < ActiveRecord::Migration[5.1]
  def change
    change_column :notifications, :post_id, :string
  end
end
