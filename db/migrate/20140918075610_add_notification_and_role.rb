class AddNotificationAndRole < ActiveRecord::Migration
  def change
    add_column :users,:role,:string
    
    create_table :notifications do |t|
      t.string :notifyable_type
      t.integer :notifyable_id
      t.string :content
      t.string :range
      t.string :media
      t.datetime :send_at
      t.integer :retry_time
      t.timestamps
    end
    
  end
end
