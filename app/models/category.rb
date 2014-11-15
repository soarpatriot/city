class Category < ActiveRecord::Base

   has_many :information

   def recently
       self.information.includes(:owner).where(publish:true).limit(4)
   end

   def self.recently_one
       Information.includes(:owner).includes(:category).where(publish:true).group("category_id")
   end
end
