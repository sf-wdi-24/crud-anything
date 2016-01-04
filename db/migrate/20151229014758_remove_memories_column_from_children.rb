class RemoveMemoriesColumnFromChildren < ActiveRecord::Migration
  def change
  	remove_column :children, :memories, :string
  end
end
