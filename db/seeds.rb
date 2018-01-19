# Category

Category.destroy_all

category_list = [
  { name: "中式料理" },
  { name: "日本料理" },
  { name: "義大利料理" },
  { name: "墨西哥料理" },
  { name: "素食料理" },
  { name: "美式料理" },
  { name: "複合式料理" }
]

category_list.each do |category|
  Category.create( name: category[:name] )
end
puts "Category created"

# Default admin

User.create(
    name: "Jianan",
    email: "root@example.com",
    password: "12345678",
    role: "admin",
    intro: "Sed pulvinar eleifend elit, et ultricies arcu iaculis in. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Duis blandit non nisi id efficitur. In commodo ipsum id ligula pretium, sed pharetra nisl ullamcorper. Ut gravida orci in justo mollis congue. Aenean ultrices vel diam a mattis. Aliquam tempor, eros nec interdum luctus, dolor odio fringilla tortor, at vestibulum nibh libero non mauris. Quisque vulputate erat accumsan mi volutpat rhoncus. Duis rutrum odio sed sem cursus commodo. Nulla vehicula felis nec quam imperdiet rutrum quis id nunc. Maecenas dictum lectus eu metus facilisis dictum. Vivamus vitae erat vitae dui semper ultrices.",
    avatar: File.open(File.join(Rails.root, "/public/seed_img/3.png")))

puts "Default admin created!"
