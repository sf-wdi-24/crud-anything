class AddButitnowAndBestofferToCards < ActiveRecord::Migration
  def change
    add_column :cards, :butItNowAvailable, :boolean
    add_column :cards, :bestOfferEnabled, :boolean
  end
end
