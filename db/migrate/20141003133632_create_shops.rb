class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
