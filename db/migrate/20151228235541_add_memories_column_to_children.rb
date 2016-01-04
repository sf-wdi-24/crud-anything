class AddMemoriesColumnToChildren < ActiveRecord::Migration
  def change
  	add_column :children, :memories, :text, array: true
  end
end
