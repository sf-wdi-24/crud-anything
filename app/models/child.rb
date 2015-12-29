class Child < ActiveRecord::Base

	belongs_to :parent

	has_many :memories, dependent: :destroy

	validates :child_first_name, 
		presence: true

	validates :child_last_name, 
		presence: true
	
end
