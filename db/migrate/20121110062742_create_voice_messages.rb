class CreateVoiceMessages < ActiveRecord::Migration
  def change
    create_table :voice_messages do |t|
      t.string :from_num
      t.string :voice_message_url
      t.integer :user_id
      t.boolean :seen
      t.integer :seen_by_id

      t.timestamps
    end
  end
end
