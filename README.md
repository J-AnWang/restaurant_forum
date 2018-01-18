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

  1. 使用者可以在任何餐廳的個別資料留下評論
  2. 使用者可以在在任何餐廳的可別資料下瀏覽他人評論
  3. 管理者能刪除任何評論

* 使用者個人資料頁面

  1.使用者可以瀏覽自己的和他人的Profile
  2.使用者可以編輯他人的資料，但不許編輯他人的
  3.在Profile頁面下，可以瀏覽他人評論過的餐廳

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

##### 14/Jan/2018

- 加入分類到後台的index and show views

##### 15/Jan/2018

- 加入選擇分類功能到 edit, view 頁面裡
- 設定category的route以及建立controller，並在內加入登入和管理員身分驗證
- 加入category index 後台頁面
- 加入新增,編,刪除功能在category index 頁面
- 重構categories controller 以及所有controller， 並新建 Admin::BaseController為admin controllers的共用controller
- 建立前台routes only for show and index

##### 16/Jan/2018

- 建立前台restaurant view的頁面,加入footer
- 建立前台show 頁面
- 建立依分類瀏覽餐廳的功能

##### 17/Jan/2018

- 建立comment model 並與restaurant以及user建立關聯
_ 建立comment routes 以及comments controller
- 建立comment create action
- 建立comment 瀏覽功能
- 建立comment 刪除功能，只有管理者可以使用

##### 18/Jan/2018

- 建立新的的dev.rake的內容來產生假的user以及comment 資料
- 建立user route 給 profile功能使用
- 在nav bar上，加上profile 的連結
