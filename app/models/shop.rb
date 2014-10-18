class Shop < ActiveRecord::Base

  validates :title, :description, :address, :contact, :phone,presence:true

  belongs_to :user
  has_many :activities
  mount_uploader :image, ShopImageUploader
end
