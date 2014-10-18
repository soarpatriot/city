class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title
      t.text :description
      t.string :image
      t.decimal :price, :precision => 10, :scale => 2
      t.integer :shop_id

      t.timestamps
    end
  end
end
