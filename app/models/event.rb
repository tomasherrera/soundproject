class Event < ActiveRecord::Base
  attr_accessible :user_id, :time_and_duration, :artist_name, :price, :description, :date, :track_url, :picture
  has_attached_file :picture, :styles => { :normal => "500x320>" },
                  :url  => "/assets/events/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/events/:id/:style/:basename.:extension"
  has_attached_file :picture_thumbnail, :styles => { :small => "260x260>" },
                  :url  => "/assets/events/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/events/:id/:style/:basename.:extension"                
  belongs_to :user
  validates_presence_of :time_and_duration, :artist_name, :price, :description, :date
  validates_attachment_size :picture, :less_than => 3.megabytes
  validates_attachment_content_type :picture, :content_type => ['image/jpeg', 'image/png']
end
