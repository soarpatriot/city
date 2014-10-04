class Information < ActiveRecord::Base
   belongs_to :user
   mount_uploader :image, InformationImageUploader
end
