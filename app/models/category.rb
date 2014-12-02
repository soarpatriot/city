class Category < ActiveRecord::Base

   default_scope {order("rank desc")}

   has_many :information

end
