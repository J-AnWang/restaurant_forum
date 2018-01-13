README
========

Rails完成餐廳評論網
-----------------

### Usage

##### Heroku

  - 後台入口：<https://restaurant-forum-jaw.herokuapp.com/>
  - 可使用 root@example.com 登入，密碼 12345678

### Project Goals

* 前後台設置

  1. 管理者能登入後台
  2. 管理者能在後台進行增／刪／查／改後台資料
  3. 管理者能在後台上傳照片
  4. 建立分頁功能

* 餐廳分類功能

  * 後台：
    1. 管理者瀏覽餐廳資料時，可以看見餐廳分類
    2. 管理者在增 ／ 改時，能選擇餐廳分類
    3. 管理者能在餐廳分類管理表上，進行CRUD
  * 前台:
    1. 使用者能瀏覽所有餐廳資料，以及餐廳的個別資料
    2. 使用者可以使用分類功能來選取餐廳

* 使用者評論功能

* 使用者個人資料頁面

* 收藏餐廳功能

* 追蹤達人功能

* 建立好友功能

### 執行時間

##### 9/Jan/2018

- 建立restaurant model
- 建立前台路口
- 建立後台路口
- 使用Devise Gem 建立 user model

##### 10/Jan/2018

- 加入驗證程序以及提示信息
- 建立後台管理員的程序驗證
- 設定後台路由
- 設定後台restaurant index action and view
- 建立後台的餐廳新增功能(new &amp; create actions and new view)

##### 11/Jan/2018

- 建立後台的餐廳刪除，編輯，瀏覽功能(destroy &amp; edit &amp; update &amp; show actions and views)
- 使用CarrierWave Gem 建立照片上傳功能
- 使用rake編輯指令來產生假資料，並套用FFaker Gem
- 使用Kaminari Gem 來實現網站分頁功能
- 安裝bootstrap-sass Gem, jquery-rails Gem以及將 .ccs改為 .scss，但還未進行修飾

##### 12/Jan/2018

- 建立 category model 並在 restaurant model 產生一個 category_id 的外鍵
- 建立種子資料(Seed)給預設categories, admin user
- 將 category 與 restaurant 做連結

##### 13/Jan/2018

- 重新產生一筆有category_id的假資料
- 對網頁做一些基本的裝飾，套入boostrap3, 自訂 scss
