class Memory < ActiveRecord::Base

	belongs_to :child

	belongs_to :parent

	validates :memory_date, 
		presence: true

	validates :memory_description, 
		presence: true

end
