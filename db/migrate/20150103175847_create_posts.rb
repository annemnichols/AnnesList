class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.string :location
      t.boolean :is_sold
      t.references :user, index: true

      t.timestamps
    end
  end
end
