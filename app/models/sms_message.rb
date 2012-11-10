class SmsMessage < ActiveRecord::Base
  attr_accessible :body, :from_num, :seen, :to_num, :user_id, :seen, :seen_by_id

  belongs_to :user
  belongs_to :seen_by, :class_name => 'User', :foreign_key => 'seen_by_id'
  has_many :notes, :as => :noteable
end
