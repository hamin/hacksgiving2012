class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :name
      t.string :description
      t.string :location
      t.string :phone_num
      t.boolean :active
      t.integer :owner_id
      t.datetime :starts_at
      t.datetime :ends_at
      t.string :twitter_handle
      t.string :twitter_hashtag
      t.string :bitly_url

      t.timestamps
    end
  end
end
