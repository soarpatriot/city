class ChangeUserIdToInformation < ActiveRecord::Migration
  def change
    rename_column :information, :user_id, :owner_id
  end
end
