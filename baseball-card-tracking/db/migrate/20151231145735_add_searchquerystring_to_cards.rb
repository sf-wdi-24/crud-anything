class AddSearchquerystringToCards < ActiveRecord::Migration
  def change
    add_column :cards, :searchQueryString, :string
  end
end
