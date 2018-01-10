namespace :dev do
  #加入 :environment 可以讓你的 Rake 與專案的 Model 和資料庫互動
  task fake: :environment do
    Restaurant.destroy_all

    500.times do |i|
      Restaurant.create!(name: FFaker::Name.first_name,
        opening_hours: "11:00",
        tel: FFaker::PhoneNumber.short_phone_number,
        address: FFaker::Address.street_address,
        description: FFaker::Lorem.paragraph)
    end
    # 利用 puts 撰寫提示訊息，幫助標示任務執行完畢
    puts "have created fake restaurants"
    puts "now you have #{ Restaurant.count } restaurants' data"
  end
end
