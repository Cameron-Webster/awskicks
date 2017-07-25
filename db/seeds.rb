# 5000.times do
# Sneaker.create(name: Faker::App.name, style_code: Faker::Code.isbn,rrp: 3000, average_price: 5000, color: Faker::Color.color_name, photo: 'image/upload/v1496326714/pzipenmaboqbrxeoy9mx.jpg')
# end

# brands = ["Nike", "Adidas", "Puma", "Diadora", "Fila"]

# prices = [300, 400, 200, 100]

# colours = ["blue", "white", "green"]

# gender = ["male", "female"]

#   100.times do
# sneaker = Sneaker.create(name: Faker::Name.name, style_code: Faker::Code.isbn, lowest_price: prices.sample, color: colours.sample, brand: brands.sample, gender: gender.sample)
# sneaker.photo = Rails.root.join("db/images/retro_jordan.jpg").open
# sneaker.save!
#   end
#   100.times do
# sneaker = Sneaker.create(name: Faker::Pokemon.name, style_code: Faker::Code.isbn, lowest_price: prices.sample, color: colours.sample, brand: brands.sample, gender: gender.sample)
# sneaker.photo = Rails.root.join("db/images/retro_jordan.jpg").open
# sneaker.save!
#   end
#     100.times do
# sneaker = Sneaker.create(name: Faker::Company.name, style_code: Faker::Code.isbn, lowest_price: prices.sample, color: colours.sample, brand: brands.sample, gender: gender.sample)
# sneaker.photo = Rails.root.join("db/images/retro_jordan.jpg").open
# sneaker.save!
#   end
#   100.times do
# sneaker = Sneaker.create(name: Faker::Name.name_with_middle, style_code: Faker::Code.isbn, lowest_price: prices.sample, color: colours.sample, brand: brands.sample, gender: gender.sample)
# sneaker.photo = Rails.root.join("db/images/retro_jordan.jpg").open
# sneaker.save!
#   end

nike = Brand.find(1)

Sneaker.all.each do |sneak|

sneak.brand = nike
sneak.save
end
