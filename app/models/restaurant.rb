class Restaurant < ApplicationRecord
  # mount_uploader是CarrierWave 提供的掛載方法，會將你指定的屬性欄位，和指定 uploader 掛載到一起
  mount_uploader :image, PhotoUploader
  validates_presence_of :name, :tel, :address, :opening_hours, :description
end
