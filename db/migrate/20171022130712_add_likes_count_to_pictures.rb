class AddLikesCountToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :likes_count, :integer, null: false, default: 0
  end
end
