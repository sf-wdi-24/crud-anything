class AddSendTimeAndCheckBoxMemory < ActiveRecord::Migration
  def change
  	add_column :memories, :send_email, :boolean
  	add_column :memories, :send_date, :date
  	add_column :memories, :parent_id, :integer
  end
end
