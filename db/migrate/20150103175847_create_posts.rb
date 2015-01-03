class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, limit: 80
      t.text :description
      t.decimal :price, precision: 8, scale: 2
      t.string :location
      t.boolean :is_sold, default: false
      t.references :user, index: true

      t.timestamps
    end
  end
end
