class ChangeSynchronizedAtFormInformation < ActiveRecord::Migration
  def change
    change_column :information, :synchronized_at, :datetime, default: Time.now rescue nil
  end
end
