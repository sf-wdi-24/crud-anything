class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.string :name
      t.date :birthday
      t.string :gender

      t.timestamps null: false
    end
  end
end
