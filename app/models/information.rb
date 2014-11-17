class Information < ActiveRecord::Base

   default_scope {order("updated_at desc")}
   validates :title, :publish, :contact, :category, presence:true
   validates :price,  numericality: { greater_than: 0},  allow_nil: true

   validate :contact_at_least_one

   belongs_to :category
   belongs_to :owner, polymorphic: true
   mount_uploader :image, InformationImageUploader


   def publish_text_tip
      self.publish == true ? "是" : "否"
   end

   def own_by_shop?
       self.owner_type == 'Shop'
   end
   def own_by_user?
       self.owner_type == 'User'
   end

   def self.recently
      categories = Category.all
      first = categories.first
      info_str = "( SELECT  `information`.* FROM `information` INNER JOIN `categories` ON `categories`.`id` = `information`.`category_id` WHERE `information`.`publish` = 1 AND `information`.`category_id` = #{first.id}  ORDER BY updated_at desc LIMIT 4)"
      categories.each_with_index  do | item, index |
         if index > 0
             info_str += " UNION (SELECT  `information`.* FROM `information` INNER JOIN `categories` ON `categories`.`id` = `information`.`category_id` WHERE `information`.`publish` = 1 AND `information`.`category_id` = #{item.id}  ORDER BY updated_at desc LIMIT 4 )"
         end
      end
      #binding.pry
      Information.find_by_sql(info_str)
      #Information.find_by_sql( "SELECT * FROM information info1 WHERE 2>(SELECT COUNT(1) FROM information info2 WHERE category_id=info1.category_id)")
   end
   private
      def contact_at_least_one
          if  !mobile_number.present? && !qq.present? && !weixin.present?
            errors.add(:mobile_number, "手机号码，QQ号，微信号至少填写一个！")
          end
      end
end
