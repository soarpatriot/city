class AddPriceToInformation < ActiveRecord::Migration
  def change
    add_column :information, :price, :decimal, :precision => 10, :scale => 2
  end
end
