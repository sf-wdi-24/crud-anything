class AddNameAndTypeToUserTable < ActiveRecord::Migration
  def change
  	add_column :users, :type, :string
  	add_column :users, :name, :string
  end
end
