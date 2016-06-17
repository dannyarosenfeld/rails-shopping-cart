class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :user_id
      t.integer :item_id
      t.integer :quantity, default: 1
      t.boolean :history, default: false

      t.timestamps null: false
    end
  end
end
