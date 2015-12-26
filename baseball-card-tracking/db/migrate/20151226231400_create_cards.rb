class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :player
      t.string :brand
      t.string :subbrand
      t.integer :year
      t.string :description
      t.float :grade
      t.company :grade
      t.string :url
      t.boolean :rookie
      t.float :pricestart
      t.float :priceend
      t.integer :bids
      t.string :sellername
      t.string :condition

      t.timestamps null: false
    end
  end
end
