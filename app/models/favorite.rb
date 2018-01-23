class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant, counter_cache: true
  # counter_cache 可以自動回傳 size 方法結果，計算關聯物件的數量
  # 必須在關聯 Model 上加一個欄位，慣例命名為 {table_name}_count
  # 有了 counter_cache 之後，就不需要手工撰寫的方法了，可以回 Model 和 Controler 將之刪除
end
