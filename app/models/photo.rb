class Photo < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  mount_uploader :photo, PhotoUploader
end
