class AddColumnsToCafeteria < ActiveRecord::Migration
  def change
    add_column :cafeteria, :latitude, :float
    add_column :cafeteria, :longitude, :float
  end
end
