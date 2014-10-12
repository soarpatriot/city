class Information < ActiveRecord::Base

   validates :title, :publish, presence:true

   belongs_to :user
   mount_uploader :image, InformationImageUploader

   def publish_text_tip
      self.publish == true ? "是" : "否"
   end

end
