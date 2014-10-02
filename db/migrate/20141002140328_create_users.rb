class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :qq
      t.string :weixin
      t.string :mobile_number

      t.timestamps
    end
  end
end
