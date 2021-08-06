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
    # {name: 'Fl'},
    # {name: 'Cl'},
    # {name: 'Fg'},
    # {name: 'Hr'},
    # {name: 'Tp'},
    # {name: 'Tb'},
    # {name: 'Tu'},
    # {name: 'Perc'}
  ]
)

4.times do |n|
  Orchestra.create(
    name: "サンプルオーケストラ#{n + 1}",
    email: "orchestra#{n + 1}@test.com",
    password: "111111",
    image_id: File.open("app/assets/images/img/no_image.png")
    )
end

5.times do |n|
  Member.create(
    instrument_id: rand(1..13),
    family_name: "#{Gimei.last.kanji}",
    given_name: "#{Gimei.first.kanji}",
    family_name_kana: "#{Gimei.last.katakana}",
    given_name_kana: "#{Gimei.first.katakana}",
    introduction: "団員#{n + 1}です。よろしくお願いします。",
    email: "member#{n + 1}@test.com",
    password: "111111"
    )
end

# 各団員がランダムに団体に所属する。
Member.all.each do |member|
  orchestras = Orchestra.all.sample(rand(3..5))
  orchestras.each do |orchestra|
    Belonging.create(
      orchestra_id: orchestra.id,
      member_id: member.id
    )
    # from = Time.parse("2021/08/01")
    # to = Time.parse("2022/01/01")
    # date = Random.rand(from..to)
    # new_practice = Practice.create(
    #   orchestra_id: orchestra.id,
    #   schedule: date,
    #   start_time: Time.now,
    #   end_time: Time.now,
    #   place: "#{orchestra.name}",
    #   note: "前中メイン#{orchestra.id}"
    # )
    # orchestra.belongings.each do |our_belonging|
    #   Attendance.create(
    #     practice_id: new_practice.id,
    #     member_id: our_belonging.member.id
    #   )
    # end
  end
end