class AddVisitCountToInformation < ActiveRecord::Migration
  def change
    add_column :information, :visit_count, :integer, default: 0 rescue nil
  end
end
