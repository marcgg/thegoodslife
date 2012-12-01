class AddOwnerIdToGoods < ActiveRecord::Migration
  def change
    add_column :goods, :owner_id, :integer
  end
end
