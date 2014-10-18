class Information < ActiveRecord::Base

   validates :title, :publish, :contact,  presence:true
   validates :price,  numericality: { greater_than: 0}
   validate :contact_at_least_one
   belongs_to :user
   mount_uploader :image, InformationImageUploader




   def publish_text_tip
      self.publish == true ? "是" : "否"
   end

   private
      def contact_at_least_one
          if  !mobile_number.present? && !qq.present? && !weixin.present?
            errors.add(:mobile_number, "手机号码，QQ号，微信号至少填写一个！")
          end
      end
end
