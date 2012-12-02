class AddLatLongToSteps < ActiveRecord::Migration
  def change
    add_column :steps, :lat, :float
    add_column :steps, :long, :float
  end
end
