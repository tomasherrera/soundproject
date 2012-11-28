class AddPictureToEvents < ActiveRecord::Migration
    def self.up
    change_table :events do |t|
      t.has_attached_file :picture
      t.has_attached_file :picture_thumbnail
    end
  end

  def self.down
    drop_attached_file :events, :picture
    drop_attached_file :events, :picture_thumbnail
  end
end
