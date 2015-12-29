class CreateMemories < ActiveRecord::Migration
  def change
    create_table :memories do |t|
    	t.date :memory_date
    	t.string :memory_description
    	t.integer :child_id

      t.timestamps null: false
    end
  end
end
