class AddUseridToRequests < ActiveRecord::Migration[5.1]
  def change
    add_column :requests, :post_user_id, :integer
  end
end
