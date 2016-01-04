class AddFirstLastNameFieldsChild < ActiveRecord::Migration
  def change
  	add_column :children, :first_name, :string
  	add_column :children, :last_name, :string
  	remove_column :children, :name, :string
  end
end
