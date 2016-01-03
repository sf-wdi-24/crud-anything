class SearchQuery < ActiveRecord::Base
	belongs_to :user
	has_many :cards

	require './lib/tasks/EbayApiCall'

	def self.auto_refresh
		"inside self.auto_refresh"
		SearchQuery.all.each do |search_q|
			EbayApiCall.new.find_by_keywords(search_q.player, search_q.grade_company, search_q.grade, search_q.year, search_q.manufacturer, search_q.user_id, true, search_q.id)
		end
	end
end
