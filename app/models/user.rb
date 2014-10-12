class User < ActiveRecord::Base

  validates :email, :encrypted_password, presence:true
  validates :name, :email, uniqueness: true
  validates :password, length: { minimum: 8 }, if: :password

  mount_uploader :avatar, UserAvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_one :shop
  has_many :information

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
