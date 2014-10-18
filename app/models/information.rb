class Information < ActiveRecord::Base

   validates :title, :publish, :contact,  presence:true
   validates :price,  numericality: { greater_than: 0}
   validate :mobile_qq_weixin_should_have_one
   belongs_to :user
   mount_uploader :image, InformationImageUploader

   def mobile_qq_weixin_should_have_one
      if self.mobile_number.blank? and self.qq.blank? and self.weixin.blank?
          errors.add(:mobile_number, "手机号码，QQ号，微信号至少填写一个！")
      end
　end

   def publish_text_tip
      self.publish == true ? "是" : "否"
   end

end
