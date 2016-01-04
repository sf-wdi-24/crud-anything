class YourScaffold < ActiveRecord::Base
	attr_accessible :description, :image, :title
	mount_uploader :image, YourUploaderClass
end
