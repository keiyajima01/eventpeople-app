Event.create(id:'2', name:'シングルス大会', type_id:'1', date_open:'2021-7-16 18:00', date_close:'2021-7-16 20:00', pref_id:'1', place:'北海道札幌市1-1-1', price:'500', price_detail:'一人につき500円です', needed_skill:'4', memo:'一緒に楽しくテニスしましょう')

5.times do |n|
  Event.create!(
    name: "ダブルス大会#{n + 1}",
    type_id:'1',
    date_open:"2021-7-16 18:00",
    date_close:"2021-7-16 20:00",
    pref_id:"1#{n + 1}",
    place:"北海道札幌市1-1-1#{n + 1}",
    user_id: "1"
  )
end
