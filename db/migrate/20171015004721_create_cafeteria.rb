class CreateCafeteria < ActiveRecord::Migration
  def change
    create_table :cafeteria do |t|
      t.string :company_name
      t.string :address
      t.text :company_profile
      t.boolean :public_release
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
