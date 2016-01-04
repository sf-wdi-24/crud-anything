class AddParentIdToChilden < ActiveRecord::Migration
  def change
  	add_column :children, :parent_id, :integer
  end
end
