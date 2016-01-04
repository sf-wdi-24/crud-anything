class CreateYourScaffolds < ActiveRecord::Migration
  def change
    create_table :your_scaffolds do |t|
      t.string :title
      t.text :description
      t.string :image

      t.timestamps null: false
    end
  end
end
