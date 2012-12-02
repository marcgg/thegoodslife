class AddLatLongToSteps < ActiveRecord::Migration
  def change
    add_column :steps, :lat, :string
    add_column :steps, :long, :string
  end
end
