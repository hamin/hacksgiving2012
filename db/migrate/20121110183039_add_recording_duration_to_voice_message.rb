class AddRecordingDurationToVoiceMessage < ActiveRecord::Migration
  def change
  	add_column :voice_messages, :recording_time, :string
  	add_column :voice_messages, :recording_sid, :string
  end
end
