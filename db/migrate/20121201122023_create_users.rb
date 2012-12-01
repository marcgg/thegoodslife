class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.text :bio
      t.string :location
      t.string :photo_url
      t.integer :score

      t.timestamps
    end
  end
end
