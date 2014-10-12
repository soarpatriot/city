class User < ActiveRecord::Base

  validates :email, :encrypted_password, presence:true
  validates :name, :email, uniqueness: true
  validates :password, length: { minimum: 8 }, if: :password

  mount_uploader :avatar, UserAvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_one :shop
  has_many :information

  after_create :set_random_avatar

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  private
     def set_random_avatar
         self.update avatar: File.open("#{Rails.root.join('app/assets/images/avatars/')}noavatar.png")
     end

end
