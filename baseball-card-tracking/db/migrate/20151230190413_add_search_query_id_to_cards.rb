class AddSearchQueryIdToCards < ActiveRecord::Migration
  def change
    add_column :cards, :search_query_id, :integer
  end
end
