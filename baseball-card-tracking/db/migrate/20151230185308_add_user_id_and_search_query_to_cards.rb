class AddUserIdAndSearchQueryToCards < ActiveRecord::Migration
  def change
    add_column :cards, :user_id, :integer
    add_column :cards, :search_query, :string
  end
end
