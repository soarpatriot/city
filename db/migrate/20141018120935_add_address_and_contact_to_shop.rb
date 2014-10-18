class AddAddressAndContactToShop < ActiveRecord::Migration
  def change
    add_column :shops, :address, :string
    add_column :shops, :contact, :string
    add_column :shops, :phone, :string
  end
end
