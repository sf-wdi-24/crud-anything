class AddTripIdToImages < ActiveRecord::Migration
  def change
  	add_column :images, :trip_id, :integer
  end
end
