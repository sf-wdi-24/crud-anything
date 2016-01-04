class Image < ActiveRecord::Base
	
	belongs_to :trip

	has_attached_file :attachment, styles: { full: "680x680>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :attachment, content_type: /\Aimage\/.*\Z/
  	validates :title, presence: true, length: { minimum: 3 }
end
