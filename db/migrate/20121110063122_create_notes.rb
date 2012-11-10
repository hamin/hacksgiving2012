class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :body
      t.references :noteable, :polymorphic => true

      t.timestamps
    end
  end
end
