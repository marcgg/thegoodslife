class AddAvailableToGoods < ActiveRecord::Migration
  def change
    add_column :goods, :available, :boolean, default: true
  end
end
