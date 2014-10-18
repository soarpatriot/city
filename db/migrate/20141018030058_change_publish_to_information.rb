class ChangePublishToInformation < ActiveRecord::Migration
  def change
      change_column :information, :publish, :boolean, default: true
  end
end
