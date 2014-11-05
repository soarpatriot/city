class Shop < ActiveRecord::Base

  VALID_URL_KEY_REGEX = /\A[a-z\d\-_]+\z/
  validates :title, :description, :address, :contact, :phone,presence:true

  validates :url, format: { with: VALID_URL_KEY_REGEX, message: "输入格式不正确" }, uniqueness: { case_sensitive: false }

  belongs_to :user
  has_many :information, as: :owner, dependent: :destroy
  has_many :activities
  mount_uploader :image, ShopImageUploader

  def access_url
     unless self.url.blank?
         "#{Settings.host}/shops/#{self.url}"
     end
  end
end
