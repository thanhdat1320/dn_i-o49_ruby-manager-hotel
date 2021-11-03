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
end if Room.count < 20
User.create!(
    name: "Đàm Vĩnh Biệt",
    email: "dam@gmail.com",
    phone: "0332813079",
    password:              "12345678",
    password_confirmation: "12345678",
    role: 2
)
User.create!(
    name: "Nguyễn Huỳnh Thanh Đạt",
    email: "dat@gmail.com",
    phone: "0332813078",
    password:              "12345678",
    password_confirmation: "12345678",
    role: 1
)
User.create!(
    name: "Trần Ngọc Huy",
    email: "truongduchuy910@gmail.com",
    phone: "0332813077",
    password:              "truongduc910",
    password_confirmation: "truongduc910",
    role: 0
)
10.times do |n|
  furniture = Faker::House.furniture
  RoomAttribute.create!(name: furniture)
end if RoomAttribute.count < 10


rooms = Room.all
rooms.each do |room| 
  attributes = RoomAttribute.order(Arel.sql("RANDOM()")).first r.rand(5)
  attributes.each do |attribute|
    RoomAttributeGroup.create!(room_id:room.id, room_attribute_id:attribute.id)
  end
end if RoomAttributeGroup.count < 10
