class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :name
  validates_uniqueness_of :email
  mount_uploader :avatar, AvatarUploader
  # 「使用者評論很多餐廳」的多對多關聯
  has_many :comments, dependent: :restrict_with_error
  has_many :restaurants , through: :comments
  # 「使用者收藏很多餐廳」的多對多關聯
  has_many :favorites, dependent: :destroy
  has_many :favorited_restaurants, through: :favorites, source: :restaurant
  # 「使用者喜愛很多餐廳」的多對多關聯
  has_many :likes, dependent: :destroy
  has_many :liked_restaurants, through: :likes, source: :restaurant

  # 「使用者追蹤很多使用者」的多對多關聯
  has_many :followships, dependent: :destroy
  has_many :followings, through: :followships
  # 「使用者被很多使用者追蹤」的多對多關聯
  has_many :inverse_followships, class_name: "Followship", foreign_key: :following_id
  has_many :followers, through: :inverse_followships, source: :user

  # 「使用者加入很多使用者為好友」的多對多關聯
  has_many :friendships, dependent: :destroy
  has_many :friendings, through: :friendships
  # 「使用者被很多使用者追蹤加入為好友」的多對多關聯
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: :friending_id
  has_many :friends, through: :inverse_friendships, source: :user

  # 此method是從model中取出登入instance role的值來判斷是否為admin
  def admin?
    self.role == 'admin'
  end

  def following?(user)
    self.followings.include?(user)
  end

  def friending?(user)
    self.friendings.include?(user)
  end
end
