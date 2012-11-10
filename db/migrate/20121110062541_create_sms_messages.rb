class CreateSmsMessages < ActiveRecord::Migration
  def change
    create_table :sms_messages do |t|
      t.text :body
      t.boolean :seen
      t.integer :seend_by_id
      t.integer :user_id
      t.string :from_num
      t.string :to_num

      t.timestamps
    end
  end
end
