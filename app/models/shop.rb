class Shop < ActiveRecord::Base

  VALID_URL_KEY_REGEX = /\A[a-z\d\-_]+\z/
  validates :title, :description, :address, :contact, :phone, presence:true
  validates_exclusion_of :url, :in => %w( support blog www billing help api test ), :message => "此关键字 <strong>{{value}}</strong> 是保留关键字，不可用，请更换其它."
  validates :url, format: { with: VALID_URL_KEY_REGEX, message: "输入格式不正确" }, uniqueness: { case_sensitive: false }, allow_blank: true

  before_validation :downcase_subdomain

  belongs_to :user
  has_many :information, as: :owner, dependent: :destroy
  has_many :activities
  mount_uploader :image, ShopImageUploader

  def access_url
     unless self.url.blank?
       "http://#{self.url}.#{Settings.domain}"
     else
       nil 
     end
  end

  protected
    def downcase_subdomain
      self.url.downcase! if attribute_present?("url")
    end
end
