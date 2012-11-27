class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :date, :null => false
      t.string :time_and_duration, :null => false
      t.string :artist_name, :null => false
      t.integer :price, :null => false, :default => 0
      t.text :description, :null => false
      t.string :track_url, :null => false, :default =>"no provided"
      t.integer :user_id
      t.timestamps
    end
    add_index :events, :user_id
  end
end
