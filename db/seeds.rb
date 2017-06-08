# 5000.times do
# Sneaker.create(name: Faker::App.name, style_code: Faker::Code.isbn,rrp: 3000, average_price: 5000, color: Faker::Color.color_name, photo: 'image/upload/v1496326714/pzipenmaboqbrxeoy9mx.jpg')
# end

Sneaker.destroy_all
  2000.times do
sneaker = Sneaker.create(name: Faker::App.unique.name, style_code: Faker::Code.isbn,rrp: 3000, average_price: 5000, color: "white")
sneaker.photo = Rails.root.join("db/images/retro_jordan.jpg").open
sneaker.save!
  end
