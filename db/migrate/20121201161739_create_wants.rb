class CreateWants < ActiveRecord::Migration
  def change
    create_table :wants do |t|
      t.integer :user_id
      t.integer :good_id

      t.timestamps
    end
  end
end
