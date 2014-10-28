class AddIndexToInformation < ActiveRecord::Migration
  def change
    add_index :information, :updated_at
  end
end
