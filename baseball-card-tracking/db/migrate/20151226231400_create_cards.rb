class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :itemId
      t.string :player
      t.string :brand
      t.string :subbrand
      t.integer :year
      t.string :title
      t.integer :categoryId
      t.string :categoryName
      t.string :currency
      t.float :price
      t.float :gradeNumber
      t.string :gradeCompany
      t.string :url
      t.string :imageUrl
      t.boolean :rookie
      t.float :pricestart
      t.float :priceend
      t.integer :numberBids
      t.string :sellingState
      t.date :startTime
      t.date :endTime
      t.string :listingType
      t.integer :conditionId
      t.string :conditionDisplayName
      t.string :sellername
      t.string :condition

      t.timestamps null: false
    end
  end
end
