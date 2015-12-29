class Child < ActiveRecord::Base

	has_many :memories, dependent: :destroy

	belongs_to :parent

	validates :child_first_name, 
		presence: true

	validates :child_last_name, 
		presence: true
	
end
