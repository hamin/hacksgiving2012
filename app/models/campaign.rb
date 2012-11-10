class Campaign < ActiveRecord::Base
  attr_accessible :active, :description, :ends_at, :location, :name, :owner_id, :phone_num, :starts_at, :twitter_handle, :twitter_hashtag, :bitly_url
end
