class AddAvailableBooleanToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :available, :boolean, :default => false
  	add_column :users, :busy, :boolean, :default => false
  end
end
