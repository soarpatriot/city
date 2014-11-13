class AddCategoryIdToInformation < ActiveRecord::Migration
  def change
    add_column :information, :category_id, :integer
  end
end
