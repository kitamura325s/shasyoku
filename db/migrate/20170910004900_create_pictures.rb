class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :title
      t.text :menu
      t.text :content
      t.integer :price
      t.integer :cafeteria_id

      t.timestamps null: false
    end
  end
end
