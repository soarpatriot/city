class AddContactToInformation < ActiveRecord::Migration
  def change
    add_column :information, :contact, :string
    add_column :information, :mobile_number, :string
    add_column :information, :qq, :string
    add_column :information, :weixin, :string
  end
end
