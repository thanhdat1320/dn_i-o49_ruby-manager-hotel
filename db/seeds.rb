r = Random.new

20.times do |n|
  image = Faker::LoremFlickr.image + "?random=" + r.rand(1000).to_s
  price = Faker::Commerce.price
  level = r.rand(4)
  status = r.rand(2)
  description = Faker::Lorem.paragraphs(number: 2)
  name = Faker::Company.name
  room = Room.create!(
    image: image,
    price: price,
    level: level,
    status: status,
    description: description,
    name: name,
  )
end if Room.count < 20

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
