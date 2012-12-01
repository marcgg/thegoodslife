class CreateStories < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.string :location
      t.integer :good_id
      t.integer :owner_id
      t.string :photo_url
      t.string :type
      t.text :message
      t.integer :winner_id

      t.timestamps
    end
  end
end
