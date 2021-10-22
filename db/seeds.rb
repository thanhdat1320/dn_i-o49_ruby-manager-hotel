r = Random.new

20.times do |n|
  image = Faker::LoremFlickr.image + "?random=" + r.rand(1000).to_s
  price = Faker::Commerce.price
  level = r.rand(4)
  status = r.rand(2)
  description = Faker::Lorem.paragraphs(number: 2)
  name = Faker::Company.name
  Room.create!(
    image: image,
    price: price,
    level: level,
    status: status,
    description: description,
    name: name,
  )
end
