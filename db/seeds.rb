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

4.times do |n|
  Orchestra.create(
    name: "サンプルオーケストラ#{n + 1}",
    email: "orchestra#{n + 1}@test.com",
    password: "111111"
    )
end

3.times do |n|
  Member.create(
    instrument_id: rand(1..13),
    family_name: "#{Gimei.last.kanji}",
    given_name: "#{Gimei.first.kanji}",
    family_name_kana: "#{Gimei.last.katakana}",
    given_name_kana: "#{Gimei.first.katakana}",
    introduction: "団員#{n}です。よろしくお願いします。",
    email: "member#{n}@test.com",
    password: "111111"
    )
end

Orchestra.all.each do |orchestra|
  #登録者全員が全団体に入団
  Member.all.each do |member|
    Belonging.create(
      orchestra_id: orchestra.id,
      member_id: member.id
    )
  end
  7.times do |n|
    from = Time.parse("2021/08/01")
    to = Time.parse("2022/01/01")
    date = Random.rand(from..to)
    new_practice = Practice.create(
      orchestra_id: orchestra.id,
      schedule: date,
      start_at: Time.now,
      end_at: Time.now,
      place: "#{n}市民センター",
      note: "今日は#{n}回目の練習です。#{n}楽章中心です。",
      start_time: date
    )
    orchestra.members.each do |member|
      Attendance.create(
        practice_id: new_practice.id,
        member_id: member.id
      )
    end
  end
end