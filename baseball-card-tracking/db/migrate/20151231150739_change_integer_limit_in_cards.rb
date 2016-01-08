class ChangeIntegerLimitInCards < ActiveRecord::Migration
  def up
    change_column :cards, :itemId, :integer, limit: 8
  end

  def down
    change_column :cards, :itemId, :integer
  end
end
