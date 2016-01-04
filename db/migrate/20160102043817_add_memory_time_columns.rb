class AddMemoryTimeColumns < ActiveRecord::Migration
  def change
  	add_column :memories, :email_date, :string
  	remove_column :memories, :send_date, :date
  end
end
