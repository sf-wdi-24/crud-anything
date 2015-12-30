class Card < ActiveRecord::Base
	belongs_to :user
	belongs_to :search_query
end
