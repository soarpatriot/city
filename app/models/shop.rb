class Shop < ActiveRecord::Base

  belongs_to :user
  mount_uploader :image, ShopImageUploader
end
