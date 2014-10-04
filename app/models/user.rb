class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_one :shop
  has_many :information

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
