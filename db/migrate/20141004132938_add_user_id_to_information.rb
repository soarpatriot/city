class AddUserIdToInformation < ActiveRecord::Migration
  def change
    add_column :information, :user_id, :integer
  end
end
