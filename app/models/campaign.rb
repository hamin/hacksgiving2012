class Campaign < ActiveRecord::Base
  attr_accessible :active, :description, :ends_at, :location, :name, :owner_id, :phone_num, :starts_at, :twitter_handle, :twitter_hashtag, :bitly_url
  has_many :sms_messages
  has_many :voice_messages
end
