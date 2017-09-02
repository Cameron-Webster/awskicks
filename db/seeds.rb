for i in 1..4 do

Blog.create(title: "Test<%= i %>", subtitle: 'test sub', content: "<p>test <%= i %></p>", remote_photo_url: "https://i.pinimg.com/564x/2e/cc/d5/2eccd5efbebb4e05cf95f4f2e53d2be3.jpg", author: 'test')

end

Promo.create(title: "Search for the best price and availability of thousands of trainers and shoes", remote_image_url: "https://i.pinimg.com/564x/2e/cc/d5/2eccd5efbebb4e05cf95f4f2e53d2be3.jpg")

Sneaker.create(name: "livetest", style_code: 'jhsdhchsbdchbshjbchjasbhcv', color: 'Blue', remote_photo_url: "https://i.pinimg.com/564x/2e/cc/d5/2eccd5efbebb4e05cf95f4f2e53d2be3.jpg", gender: 'female', brand_id: 6, sneak_brand: 'Adidas')
