class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :line

      t.timestamps null: false
    end
  end
end
