class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.string :photo
      t.integer :user_id
      t.integer :category_id
      t.string :description

      t.timestamps null: false
    end
  end
end
