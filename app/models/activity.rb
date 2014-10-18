class Activity < ActiveRecord::Base

   validates :title, :description, presence:true
   belongs_to :shop

end
