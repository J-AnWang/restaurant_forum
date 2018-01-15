class Category < ApplicationRecord
  validates_presence_of :name
  #  注意！設定 has_many 時，後面接的參數為複數
  # dependent: :destroy表示在刪除某筆 Category 資料時，需要一併刪除所有關聯的 Restaurant 資料
  has_many :restaurants
end
