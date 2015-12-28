class Trip < ActiveRecord::Base
	has_many :posts, dependent: :destroy
	has_many :images, dependent: :destroy

	validates :name, presence: true, length: { minimum: 3 }

	validates :description, presence: true, length: { minimum: 5 }

	validates :attachment, presence: true
end
