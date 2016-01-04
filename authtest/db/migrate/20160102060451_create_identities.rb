class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.string :by
      t.string :default

      t.timestamps null: false
    end
  end
end
