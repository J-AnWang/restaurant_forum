class Restaurant < ApplicationRecord
  # mount_uploader是CarrierWave 提供的掛載方法，會將你指定的屬性欄位，和指定 uploader 掛載到一起
  mount_uploader :image, PhotoUploader
  validates_presence_of :name, :tel, :address, :opening_hours, :description
  # 注意！設定 belongs_to 時，後面接的參數為單數
  # 允許「未分類」的 Restaurant 資料，你就需要在 belongs_to 的宣告後，加上 optional: true 的設定
  belongs_to :category
  has_many :comments, dependent: :destroy

  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  def is_favorited?(user)
    self.favorited_users.include?(user)
  end

  def is_liked?(user)
    self.liked_users.include?(user)
  end

  # 用來計算favorites_count class method
  def self.count_favorites
    Restaurant.all.each do |restaurant|
      restaurant.favorites_count = restaurant.favorites.count
      restaurant.save
    end
  end

end
