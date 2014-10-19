class AddOwnerTypeToInformation < ActiveRecord::Migration
  def change
    add_column :information, :owner_type, :string, default: 'User' rescue nil
  end
end
