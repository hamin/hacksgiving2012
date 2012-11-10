class AddCampaignIdToItems < ActiveRecord::Migration
  def change
  	add_column :sms_messages, :campaign_id, :integer
  	add_column :voice_messages, :campaign_id, :integer
  end
end
