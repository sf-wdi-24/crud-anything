class AddFirstLastNameFields < ActiveRecord::Migration
  def change
  	add_column :parents, :first_name, :string
  	add_column :parents, :last_name, :string
  	remove_column :parents, :name, :string
  end
end
