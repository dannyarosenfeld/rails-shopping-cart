class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.text :text
      t.integer :price
      t.string :image

      t.timestamps null: false
    end
  end
end
