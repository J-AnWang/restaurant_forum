class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :avatar, AvatarUploader

  has_many :comments

  # 此method是從model中取出登入instance role的值來判斷是否為admin
  def admin?
    self.role == 'admin'
  end
end
