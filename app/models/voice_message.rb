class VoiceMessage < ActiveRecord::Base
  attr_accessible :from_num, :note_id, :seen, :seen_by_id, :user_id, :voice_message_url, :recording_sid, :recording_time, :campaign_id

  belongs_to :user
  belongs_to :seen_by, :class_name => 'User', :foreign_key => 'seen_by_id'
  has_many :notes, :as => :noteable  
  belongs_to :campaign
end
