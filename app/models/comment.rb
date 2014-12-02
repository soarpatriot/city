class Comment < ActiveRecord::Base

  default_scope {order("id desc")}
  belongs_to :user
  belongs_to :commentable, polymorphic: true

end
