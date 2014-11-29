class AddSynchronizedAtToInformation < ActiveRecord::Migration
  def change
    add_column :information, :synchronized_at, :datetime, default: Time.now rescue self.updated_at
    add_index :information, :synchronized_at
  end
end
