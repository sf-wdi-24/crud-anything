class ChangeNameFieldsParentChild < ActiveRecord::Migration
  def change
  	rename_column :parents, :first_name, :parent_first_name
  	rename_column :parents, :last_name, :parent_last_name
  	rename_column :children, :first_name, :child_first_name
  	rename_column :children, :last_name, :child_last_name
  end
end
