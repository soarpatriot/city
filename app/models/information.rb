class Information < ActiveRecord::Base

   acts_as_votable

   default_scope {order("synchronized_at desc")}
   validates :title, :publish, :contact, :category, presence:true
   validates :price,  numericality: { greater_than: 0},  allow_nil: true

   validate :contact_at_least_one

   belongs_to :category
   belongs_to :owner, polymorphic: true
   has_many :comments, as: :commentable

   mount_uploader :image, InformationImageUploader
   # has_one :cover, class_name:"Photo", as: :imageable
   has_many :photos, as: :imageable

   after_create :update_synchronized_at

   def cover
      c = self.photos.where(cover:true).first
      if c.nil?
         c = self.photos.first
      end
      c
   end

   def publish_text_tip
      self.publish == true ? "是" : "否"
   end

   def own_by_shop?
       self.owner_type == 'Shop'
   end
   def own_by_user?
       self.owner_type == 'User'
   end

   def increment_visit_count
      visit_count = self.visit_count + 1
      self.update visit_count:visit_count, updated_at:self.updated_at
   end

   def update_synchronized_at
      self.update synchronized_at:Time.now
   end

   def self.recently

      information = []
      categories = Category.all

      unless categories.empty?
         first = categories.first
         info_str = "( SELECT  `information`.* FROM `information` INNER JOIN `categories` ON `categories`.`id` = `information`.`category_id` WHERE `information`.`publish` = 1 AND `information`.`category_id` = #{first.id}  ORDER BY cached_votes_up desc LIMIT 1)"
         info_str += " UNION ( SELECT  `information`.* FROM `information` INNER JOIN `categories` ON `categories`.`id` = `information`.`category_id` WHERE `information`.`publish` = 1 AND `information`.`category_id` = #{first.id}  ORDER BY synchronized_at desc LIMIT 1)"
         categories.each_with_index  do | item, index |
            if index > 0
               info_str += " UNION (SELECT  `information`.* FROM `information` INNER JOIN `categories` ON `categories`.`id` = `information`.`category_id` WHERE `information`.`publish` = 1 AND `information`.`category_id` = #{item.id}  ORDER BY cached_votes_up desc LIMIT 1 )"
               info_str += " UNION (SELECT  `information`.* FROM `information` INNER JOIN `categories` ON `categories`.`id` = `information`.`category_id` WHERE `information`.`publish` = 1 AND `information`.`category_id` = #{item.id}  ORDER BY synchronized_at desc LIMIT 1 )"
            end
         end
         #binding.pry
         information = Information.find_by_sql(info_str)


      end
      information

      # Information.group("category_id")
      #Information.find_by_sql( "SELECT * FROM information info1 WHERE 2>(SELECT COUNT(1) FROM information info2 WHERE category_id=info1.category_id)")
   end

   def self.categories
      categories_information = []
      categories = Category.all

      unless categories.empty?

         categories.each_with_index  do | item, index |
            info_str = "( SELECT  `information`.* FROM `information` INNER JOIN `categories` ON `categories`.`id` = `information`.`category_id` WHERE `information`.`publish` = 1 AND `information`.`category_id` = #{item.id}  ORDER BY cached_votes_up desc LIMIT 2)"
            info_str += " UNION ( SELECT  `information`.* FROM `information` INNER JOIN `categories` ON `categories`.`id` = `information`.`category_id` WHERE `information`.`publish` = 1 AND `information`.`category_id` = #{item.id}  ORDER BY synchronized_at desc LIMIT 2)"
            information = Information.find_by_sql(info_str)
            infos = { categrory: item, information: information }
            categories_information.push infos
         end
         # binding.pry
         # information = Information.find_by_sql(info_str)

      end
      categories_information
   end

   private
      def contact_at_least_one
          if  !mobile_number.present? && !qq.present? && !weixin.present?
            errors.add(:mobile_number, "手机号码，QQ号，微信号至少填写一个！")
          end
      end
end
