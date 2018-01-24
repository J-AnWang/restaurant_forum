namespace :dev do
  #加入 :environment 可以讓你的 Rake 與專案的 Model 和資料庫互動
  task fake_restaurant: :environment do
    Restaurant.destroy_all

    500.times do |i|
      Restaurant.create!(
        name: FFaker::Name.first_name,
        opening_hours: "11:00",
        tel: FFaker::PhoneNumber.short_phone_number,
        address: FFaker::Address.street_address,
        description: FFaker::Lorem.paragraph,
        category_id: Category.all.sample.id,
        image: File.open(File.join(Rails.root, "/public/seed_img/#{rand(0..20)}.jpg")))
    end
    # 利用 puts 撰寫提示訊息，幫助標示任務執行完畢
    puts "have created fake restaurants"
    puts "now you have #{ Restaurant.count } restaurants' data"
  end
  # 用來產生假的user資料
  task fake_user: :environment do
    @user = User.all
    #不要刪除管理員帳號
    @user.each do |user|
      if !user.admin?
        user.destroy
      end
    end
    20.times do |i|
      user_name = FFaker::Name.first_name
      User.create!(
        name: "#{user_name}",
        email: "#{user_name}@example.com",
        password: "12345678",
        avatar: File.open(File.join(Rails.root, "/public/seed_img/#{rand(0..5)}.png")))
    end

    puts "have created fake users"
    puts "now you have #{User.count} users' data"
  end
  # 用來產生假的comment資料
  task fake_comment: :environment do
    Comment.destroy_all

    Restaurant.all.each do |r|
      3.times do |i|
        r.comments.create!(
          content: FFaker::Lorem.sentence,
          user: User.all.sample
        )
      end
    end
    puts "have created fake comments"
    puts "now you have #{Comment.count} comments' data"
  end

  task fake_favorite: :environment do

    500.times do
      Favorite.create!(
        user_id: User.all.ids.sample,
        restaurant_id: Restaurant.all.ids.sample
      )
    end

    puts "have created fake favorites"
    puts "now you have #{Favorite.count} favorites' data"
  end
end
