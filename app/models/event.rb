class Event < ActiveRecord::Base
  attr_accessible :user_id, :time_and_duration, :artist_name, :price, :description, :date, :track_url
  belongs_to :user
  validates_presence_of :time_and_duration, :artist_name, :price, :description, :date
end
