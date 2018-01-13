class Restaurant < ApplicationRecord
  # mount_uploader是CarrierWave 提供的掛載方法，會將你指定的屬性欄位，和指定 uploader 掛載到一起
  mount_uploader :image, PhotoUploader
  validates_presence_of :name, :tel, :address, :opening_hours, :description
  # 注意！設定 belongs_to 時，後面接的參數為單數
  # 允許「未分類」的 Restaurant 資料，你就需要在 belongs_to 的宣告後，加上 optional: true 的設定
  belongs_to :category
end
