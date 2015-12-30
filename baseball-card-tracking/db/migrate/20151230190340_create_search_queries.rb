class CreateSearchQueries < ActiveRecord::Migration
  def change
    create_table :search_queries do |t|
      t.string :search_query
      t.integer :user_id
      t.string :player
      t.integer :year
      t.string :manufacturer
      t.string :grade_company
      t.integer :grade

      t.timestamps null: false
    end
  end
end
