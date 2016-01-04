class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :story
      t.timestamps

      t.timestamps null: false
    end
  end
end
