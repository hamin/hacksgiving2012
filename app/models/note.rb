class Note < ActiveRecord::Base
  attr_accessible :body, :message_id, :message_type

  belongs_to :noteable, :polymorphic => true
end
