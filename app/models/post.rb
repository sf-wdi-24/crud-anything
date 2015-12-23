class Post < ActiveRecord::Base
	belongs_to :trip

	validates :title, presence: true, length: { minimum: 3 }

	validates :content, presence: true, length: { minimum: 5 }
end
