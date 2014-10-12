class AddPublishToInformation < ActiveRecord::Migration
  def change
    add_column :information, :publish, :boolean
  end
end
