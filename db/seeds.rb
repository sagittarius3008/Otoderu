# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Instrument.create(
  [
    {name: 'Cond'},
    {name: 'Vn1'},
    {name: 'Vn2'},
    {name: 'Va'},
    {name: 'Vc'},
    {name: 'Cb'},
    {name: 'Fl'},
    {name: 'Cl'},
    {name: 'Fg'},
    {name: 'Hr'},
    {name: 'Tp'},
    {name: 'Tb'},
    {name: 'Tu'},
    {name: 'Perc'}
  ]
)

5.times do |n|
  Orchestra.create(
    name: "サンプルオーケストラ#{n + 1}",
    email: "orchestra#{n + 1}@test.com",
    password: "111111",
    image_id: File.open("app/assets/images/img/no_image.png")
    )
end

9.times do |n|
  Member.create(
    instrument_id: rand(1..13),
    family_name: "#{Gimei.last.kanji}",
    given_name: "#{Gimei.first.kanji}",
    family_name_kana: "#{Gimei.last.katakana}",
    given_name_kana: "#{Gimei.first.katakana}",
    introduction: "団員#{n + 1}です。よろしくお願いします。",
    email: "member#{n + 1}@test.com",
    password: "testtest"
    )
end

# 作成中
# Member.all.each do |member|
#   rand(0..3).times do
#     orchestras = Orchestra.all.sample(rand(1..5))
#     belongings = []
#     orachestras.each do |orachestra|
#       belonging = Belonging.new(
#         orchesta_id: orachestra.id,
#         part_top: rand(0..1),
#         belonging_status: 0
#       )
#     end

#     order = Order.create!(
#       customer_id: customer.id,
#       price: order_price,
#       payment_method: rand(0..1),
#       name: customer.last_name + customer.first_name,
#       address: customer.address,
#       postal_code: customer.postal_code
#     )

#     order_items.each do |order_item|
#       order_item.order_id = order.id
#       order_item.save
#     end
#   end
# end